Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7481158wrq;
        Thu, 28 Jun 2018 07:15:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcGrwZeonHTEYOFDONQgiahPh3+otL7GbU6IeaHihe1xDnhyuG67aeXDhY4onk6T7aXUdZ7
X-Received: by 2002:ac8:2506:: with SMTP id 6-v6mr9877966qtm.9.1530195344803;
        Thu, 28 Jun 2018 07:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530195344; cv=none;
        d=google.com; s=arc-20160816;
        b=UwSlxemsmgWeLPHNVCtUIXi6zu8o+VVXU1WUiQJqi4sSdm0/HsCmMfzOFPtaDBt8Bs
         UxskQw5OQBe377pUcovkkz/HSbI3pqhjzYEJoxUYZ0/wSHgFM/QxZOBzU+Jk7mrZ09SV
         +bb6C1Y01d2bZUIgFPQPcrLD3qfPN1zNhD7Kw/2PaEyt/OddchrEBdgT2DvjA/vxl8w6
         BF+o10xFQMpYpbYJUC1AAP1lnDSQxow6x4oc379evIveSe1/706Y7/3vkZvDQlFgazva
         AEhQQKSTya0zdyNLZsIXMdSc9wYDBEousNzCIP20f7dDQTDOlIl42IlaMN2ymqH3Oafu
         ubog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5qwny3lq+XdST6KH9X5kXQ99BTFl7s+VvNWm2Y0LGGA=;
        b=at3Ydge7qY+zeL9cXUBO8RNjOCA+H86PqRUvY/I4atXdCYDf/d2k1aEMhzLOkErE+R
         ZXgBhqQp7iLc0XdLDs6/AviRw0QHR2xG3nih0LFdnoQRUbcj6Mnn2UQ+ovIVkP/YLi7S
         XHjNR8Rguofo7Y+vIQEOVmvVqBjyVTk2iFN2CVW22ju5QA0w64ytWieeVs2L4fCcOU45
         gX9TW1hJXh66RniyuDiGG2KtxM+RgBuZQkA9hfGdcjswxVG+mxhvbaeeQ2Vv9Lb4SmS0
         C/ypxWwIE9B7ogv6oHeKLy8RgEIBELLBaYmA8vqetbqjBLyVrSurimS7+OQwOrA1vy0E
         cB3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g6ildqKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l66-v6si319385qkb.298.2018.06.28.07.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 07:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g6ildqKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYXi4-0000GW-AS
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 10:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYXhs-0000Eb-RV
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 10:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYXhm-0007r0-UE
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 10:15:32 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:42751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYXhm-0007pn-PM
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 10:15:26 -0400
Received: by mail-oi0-x242.google.com with SMTP id n84-v6so5313234oib.9
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5qwny3lq+XdST6KH9X5kXQ99BTFl7s+VvNWm2Y0LGGA=;
	b=g6ildqKBpEGRmM2+OALzCX3HsVzcRIBFknUP/34WDOc+4UN89LS/nut1/kjanxKDQJ
	+OR9KCS2Czl/P2qYb/DEJqegZxl5Ts352+OukD4u/xy4C4mwv9SYF+pzdLQG/SOQtse4
	SsZeZ9lGXNCryub/mTq8gfXCuh6RVOuiM2vvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5qwny3lq+XdST6KH9X5kXQ99BTFl7s+VvNWm2Y0LGGA=;
	b=FChczd1g6fAnqgf07R7arJO80VgQhjzfBo+iAzN6nVoY9vpfs5JxouA552LmCNyCvM
	RbQcuU6EF4Km0lybrL5WXJjeltQRJAi8Oqty9dsO12kIL6T3utJG6VwA+9QWIhT0Dopj
	aAet0bhdAhFk4hySR45x0lMBj+AWau+l2Kzf5whzO0GIbTuksgaASq/KUtvU8iUO1eu/
	LdFqcx42nv24BbNpJ832Qpd1adiuga6yMQv/oh9KHvuTXWDjqNuz9yzknN2DxEgv9nLQ
	hkbOR1i9ZGF7eRtJ1xWJcgWjEd9wHRUXLYML0dR3TY/M+U4HtnvcrLiY/oYr6+ciBgfD
	vf/w==
X-Gm-Message-State: APt69E37NaGsykGOlsS5hH8QbaVRNK/mL2j2ug4bxdDk3WbtmMFRDzQq
	ecX+/r5oB8815mYTq1M1ly9yr2cAw4/wQWvTGkjteA==
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr6006960oie.12.1530195326040; 
	Thu, 28 Jun 2018 07:15:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 07:15:05 -0700 (PDT)
In-Reply-To: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
References: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 15:15:05 +0100
Message-ID: <CAFEAcA9v4J8v8Z35LzqfeVBFRa6Vsbp0jfddk8Tg1yzZpJSjig@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v4 0/3] ARM virt: Silence dtc warnings
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aVvzH2pTeRMC

On 26 June 2018 at 21:21, Eric Auger <eric.auger@redhat.com> wrote:
> When running dtc on the guest /proc/device-tree, we get the
> following warnings: "Warning (unit_address_vs_reg): Node <name>
> has a reg or ranges property, but no unit name", with name:
> /intc, /intc/its, /intc/v2m, /memory.
>
> This series removes those warnings by adding the unit address to
> the corresponding node names.
>
> This is based on Peter's target-arm.next
>
> Best Regards
>


Applied to target-arm.next, thanks.

-- PMM
