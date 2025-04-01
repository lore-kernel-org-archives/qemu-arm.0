Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2480937njd;
        Mon, 31 Mar 2025 18:08:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9eu8xU2L48GqnBmev+dBYjuIT73XtxtTm+drjlG73AJv4/iZxzWcWUj8op9xiRuo8wMzIF21tCB76ig==@linaro.org
X-Google-Smtp-Source: AGHT+IFoeF9DSSCHFTa17Oc4HE9L5odnr0ZtP7c6k4NPGgoyc10hH+KG9EaMFMiccnoivydVUgX7
X-Received: by 2002:a05:620a:258a:b0:7c5:4c49:7697 with SMTP id af79cd13be357-7c6862eb8eemr1467915585a.6.1743469710167;
        Mon, 31 Mar 2025 18:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743469710; cv=none;
        d=google.com; s=arc-20240605;
        b=KNtqoAesBY8jTgvbdQIc5jC/XoD1Ja6buWCGV8NJ79IyQiSMYirYqHfZoGx24k2lAg
         G0zHd8UkoCSJyG0SAHNoH+f9sEZ/jafCvWZGpdol9lTP0rvDuC7QhkH6JoQMvB0YKt3A
         /+AQKDYnItMIb5QbJa09nIX+b7ibB3lQDJoVOIMVTrPwUTq7PCBSaHlVysWKVajlsLLf
         IcunwWi9iMNZrRJ7hVq1lU8zAuA9KyfR7YjWXnG2sTmPZDOhR8cGWNyClGN6pziWDs0u
         k2ovX5gHf99BxU5SEKxGY7USA5G12Ao5l37HLq66wHmZwVp7nkeEu1vmUQM0VnpaEQ8S
         8pkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=AeXoW4qhjGDr3OZ+osAyoKWodzZ7uNbS3OT0JucGZ7o=;
        fh=iXfICh/9hUFSJvI/uJNyK9bAVic1IOKG+4dUsuNw2Ng=;
        b=by8y8UTYSCfQ0Czkyh1fAkcO5zdwdTpTmnOK2qudCiQ4K4p+04CRrOvnLO2TJjnBcu
         6n8VzReRvT3XvSbkk3SegfDou73L5ejit+a8DO6XVh0wR+G1fBbV4OJdgwpYyrS7okS5
         Y1w03E/Obr0jxy5cuAomPvQ5QClaHrrdh6b8Dx8iUg4SE2vbTXEtzpo5LHssMFzzxiRA
         lKuCJK5oKxzUND3QphSSUQBIYhLdkrSSYk0XoKOqgw8WqJD+SQSquoYKQEjtevC3JOHu
         AiOLsp2f570D3/PZY5dis8wxqXimOp03GbBpS5Lj99Ey7BFVCSR7tkoxrgOFyMQQ9XcS
         oHIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=huqzEA9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec97d006asi77573406d6.410.2025.03.31.18.08.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 18:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=huqzEA9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzQ6p-0000Fh-DT; Mon, 31 Mar 2025 21:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tzQ6i-0000F8-IK; Mon, 31 Mar 2025 21:08:01 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tzQ6f-0004gT-Vt; Mon, 31 Mar 2025 21:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1743469666;
 bh=AeXoW4qhjGDr3OZ+osAyoKWodzZ7uNbS3OT0JucGZ7o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=huqzEA9i8JcJeY/OFthNJXafGaAwCBEAV/1m3icFnw7b6TrUEqg6lbmsuiqQoILfO
 P3p/1G5C20vfqNsfBdu+mdSYIygVV/NoKaRRUq3rc+8Y/383DAoFH+1VyqFSGXwQQ+
 9lT5490P20qNb9NvoWnEdaLbfh0vB9cxtod+xsw7+qhXNTtbpcnlM8a0iSTw+s4ocB
 9cODOu+EuMgHOqjnLhk5XwE85L71Je3QoS+6sluV/AGMB1+rjatMAqYEql1A5T0/7N
 QU/7lRX3ql6oIoiwjpgU9KJj/JZ0l83iTdrlYZbP9GIb6QltnAqnVviEVK+vI5n4nr
 qDsS9Rt9a6hCQ==
Received: from [10.194.67.88] (unknown [180.150.112.225])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BD1707B352;
 Tue,  1 Apr 2025 09:07:44 +0800 (AWST)
Message-ID: <3720f2efc3778e722adc8add248954b46070139c.camel@codeconstruct.com.au>
Subject: Re: [PATCH-for-10.0 1/2] hw/misc/aspeed_scu: Set
 MemoryRegionOps::impl::access_size to 32-bit
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org
Date: Tue, 01 Apr 2025 11:37:43 +1030
In-Reply-To: <20250331230444.88295-2-philmd@linaro.org>
References: <20250331230444.88295-1-philmd@linaro.org>
 <20250331230444.88295-2-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vJ8y0Hz4zy9J

On Tue, 2025-04-01 at 01:04 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> All MemoryRegionOps::read/write() handlers switch over a 32-bit
> aligned value, because converted using TO_REG(), which is defined
> as:
>=20
> =C2=A0 #define TO_REG(offset) ((offset) >> 2)
>=20
> So all implementations are 32-bit.
> Set min/max access_size accordingly.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

