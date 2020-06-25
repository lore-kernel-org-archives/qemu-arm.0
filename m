Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1286798lfm;
        Thu, 25 Jun 2020 06:19:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhJauLfGlP37oouw9Bap0FBLJJRh1C57sAm65i343fg4AqwN34y7+WTN/7QX5pcE+7WjkZ
X-Received: by 2002:a25:7811:: with SMTP id t17mr13923710ybc.508.1593091147423;
        Thu, 25 Jun 2020 06:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593091147; cv=none;
        d=google.com; s=arc-20160816;
        b=d89ZCHY6wQ03vQE64dfyjEWIAjmpeHCgrqxDzpPGrQW5i6xbopIvcw4vExFkYnp5j3
         0eGLqcJf+gaSuVBr2+lAj1CwpN6iP2po19vhfusaWdOWjb83nPhDpgRneLrOCj+yFVTD
         9KNW7yWUFBp9Jq0KH4AIK2BEPdQJlz3g5f47EpnB0wwEl5BJdDMgYMx8ywQ21LuRCDLL
         gkYsj8D7uKLGIs1sgCqPSkUv1AJJzxCRjdZ3pu5Dr4/tXOEzff6+MXboIPDbn+sn5suJ
         q0zrjkUutdlYRAn+OCMFM1brcD0Yl2NZrP2TUkL0J96nTb3S7nOG1RokX3T/Gi4wbJ8Z
         Tp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=f6g8y7ZckUShav8n8cxxoZCVcK4tu3TwSv063R9jGqU=;
        b=0JibJcIHnXpcvX2JQYwzTSf5oTq+o3rGQ01fMGCkHuDo51axebssmJq8HDEv3/HkMG
         ai2gO1iSLdzSnLyRYjUAWpUhltQ9kznLrBOh/sk9WaNfDn4REcH9jW1TdqCHVoz8W9cg
         4QxKBnmtXE2b0jWxDrxJnaqTFKC4y2uTSm6BGfXEji0kIfOtmRfA8NayCQ7mxpJouMS5
         XNZT+BuczhYGqdR0URYL4oF+s6ZElpL+wugCVFjIs5S7vCV0ofRE+p5P/ksfdHjHVGhn
         G5Df5zqe7DVVcHKMysuGUc8HRzZGziVox92HnP1B2bEvxFpKYzln18wtin3OavLvA+ND
         YzkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bt4s4Q07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si34955940ybt.63.2020.06.25.06.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bt4s4Q07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joRmU-0007qh-P9
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 09:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRmM-0007qJ-QM
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:18:58 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:46349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRmJ-0001Zo-Mx
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:18:58 -0400
Received: by mail-ot1-x32a.google.com with SMTP id n24so2942885otr.13
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f6g8y7ZckUShav8n8cxxoZCVcK4tu3TwSv063R9jGqU=;
 b=Bt4s4Q074ayxhgpYgloGeim3whJKAawl6PmqZtl0Pygjilx+dbrxc/zz7YhWfcAMUA
 I5SRL5+ebvCAAX03eriLirJBSOZRBScWAJt6ieVyXJmwXnglNLMkQfy8uiMTOa+Dpd61
 trn2vvY5+oCJFUa06Y5W9wNgjMUONBv7vYvff5WWc4wDWfs2+lco0o7qvY59ndDv3r29
 4v1VRBwVUkZb7ekWt7cFYXwGrzu4jtFmWUea9NVYyq7lTGosPbk2PlSsSnUHu9WGQ8vY
 Nn8CBWHGaSNiwFUFXMzMHCDfo+N5ia6VhLTQTCr2Tzgp6lMEYjS4eYimXW4fFgS3jXUJ
 w00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f6g8y7ZckUShav8n8cxxoZCVcK4tu3TwSv063R9jGqU=;
 b=ASM15qmfCFU4FyGZrgGMJ/KARfp8wPzjp56NpO3IDQ3YAZxEzMwzmcsoKZFYVFIC9+
 Cos7BuqfMJfLB2Y2fVAXAFCpK5SC5aj+fWX/1WwFkS9YM3eUY8LMT/umJfYW8sDysfq3
 znO4mq1HEuLtV+0DvuUde0bUpNrBG8YErrwopzt7/+wvsNqhDO9tW0VUKrCBllj5pZcS
 FOWAV47g+xbANb9goDYo4QIKkcwOTe3gvaFIYA96DbWgNrBeP2IaEC9ot4UjeaKNs0WN
 1fHFPb+Yy8O3Mvgo2YrxL2q+29b9wjlKUiWSy0lRs9AzrW5ZxtMddpOr9icwbbBmIitI
 +eLw==
X-Gm-Message-State: AOAM532zwm9nZ2sP+JT9BzdtsNPFZAY9vWs+jz7fF7eic/6jocye8369
 fj/JZmlThC5e8axQOSh2LSEtOvQn31sGL+3/N7s88w==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr26557737oto.91.1593091134339; 
 Thu, 25 Jun 2020 06:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200623072132.2868-1-f4bug@amsat.org>
In-Reply-To: <20200623072132.2868-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 14:18:43 +0100
Message-ID: <CAFEAcA8NP41n4NG_mDKLC-=e1tpcChotG=rot_NoHSdS=ENRoA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/arm/aspeed: Improve QOM usage
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzG+KS1MbI4A

On Tue, 23 Jun 2020 at 08:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Yet another cleanup.
> Simplify aspeed machine QOM usage.
>
> Since v1, addressed C=C3=A9dric review comments:
> - Rename AspeedBoardState -> AspeedMachineState
>



Applied to target-arm.next, thanks.

-- PMM
