Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp595455wrt;
        Tue, 20 Nov 2018 06:01:44 -0800 (PST)
X-Google-Smtp-Source: AJdET5cXZ3HDxlJA7ZbM+EyfSkyHwas/MM6C4FcTkCHDP8Z6z7Lq9xGV4+A8fYpac0VofjOHVUQz
X-Received: by 2002:ac8:690e:: with SMTP id e14mr1921905qtr.204.1542722504168;
        Tue, 20 Nov 2018 06:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542722504; cv=none;
        d=google.com; s=arc-20160816;
        b=rDj8QXeovAUeTPOPI5VZ3zS83IKvTZU3u6kO+U7Hc7NJdk6j/d+jm5IX+gzvlcHzR6
         Crx9TxnnB6TQWK0cf5zcE8K8gHr7IfGXNkfTBbQWcec3UvyBzFQD8uyO/MnrdTF1OKWS
         zGrj+9xpoMJxgKGxt8CxmSlIVjKgG7+jgIFZ8gaYK+BZqG5PPmixhl8vFzf1FHrn3OkD
         Sh+d69hh4Dulcf5XMYMCuRkhGPUnyEXQbtk9ddOXRXmhasCnNO4688oXs1S8dvek+5j7
         Y6XoBT3m98uQIi7V3MdhRpqLCnPlr2jAlxQOn+Iolsf6nGBKVWOlHWE5puXhj8EBlw5c
         kmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=pp7+6MxNEpUjkupTsqOLegHbiXS5VuSUusDJ3zW5AKw=;
        b=tl1L4mTRZ/UQ19PKewx2kLRHJEdkGMrPKh687K9MFgUcW7F37lZsaESm8Wekq3Xkfi
         Q4T0CyfkILQfHpTArYu68fVkLr9zkgJrG2TZdyqHaphOljR73ZTbwGYgizm3cq6GXblA
         ipmB2TUNZNob+tOWQBjJBjYsLPD2DICddO0NnwH5iX22fOxg/zejynpdfKBoLMGfUlvo
         cofBGR4McMT39mUlYxlfxL156L5DBCnfLUiqNToEHiM9777pl7Jo55QRNnn+J9tAHGGj
         oVjoCoYcRjgxoDqhgArCjmpwYWdPkrtSqf0FrbVw4Kvdq51CKkD7HDyuMsTbgrldFN1Y
         Jn9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EO1XTvFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j35si3998827qtc.137.2018.11.20.06.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 06:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EO1XTvFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP6b1-0000nB-DJ
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 09:01:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6am-0000ll-Si
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6ab-0003Vs-41
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:01:25 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38471)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP6aa-0003Uu-Ki
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:01:16 -0500
Received: by mail-oi1-x241.google.com with SMTP id a77so1549645oii.5
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 06:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pp7+6MxNEpUjkupTsqOLegHbiXS5VuSUusDJ3zW5AKw=;
	b=EO1XTvFsMYpQCNDXlHVRCR59QGJyhS9HrnFsFrpYVoKt5dK3DBEuGKUINSoqsw2znx
	p+CNcF2Lxd83QpLWeWeQQyUc1eYPtRDBCR8irVlnE6pGsl0A44Os/9ILsOqElvkZP5eN
	YC/hvDRbttuuI87v37N6cYSYpiMCOqy2Eodss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pp7+6MxNEpUjkupTsqOLegHbiXS5VuSUusDJ3zW5AKw=;
	b=o++63G17Cb3AVTkpbm2KrwYqWvQG9CrbZAM3xxG7B7gNVEfJUBU0vM4n2b0ITZJ0DI
	MXNxHuiYc0soLvp/wxIsUTguTkBZM8QFg3ZvzSrwahImy3E4BdoO9cTQQYoVTrsxq3u1
	KAocP7B3rhnF+h6ku7OuMhiYWCrCpCBry8ziUweK0hoyCG4xFG6QUOV+wgQczmI8yyVV
	gkkxLwi5dH6UY8Q3WtLPz67IaYaAaxS1eNHBMAA8JyVq04MXR0anZb8JJoJnY1G92L98
	Mfl3P1RbkgOQCUxpQWBcSKxyHsYWYGo9JDjWwSu4P6wwZV8HdJc7qTn6e5IkQpDbaMsf
	B2eg==
X-Gm-Message-State: AGRZ1gKccQGGQrU0UR8W5ab/bgYX+puf8UYXTC5XGHrcyt4rRh4p04uQ
	iGOVbOuvttHRKPMMDN/VzVpmJKFUszbyJLIhyICBUg==
X-Received: by 2002:aca:f1d6:: with SMTP id
	p205-v6mr1202402oih.332.1542722475891; 
	Tue, 20 Nov 2018 06:01:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:00:55
	-0800 (PST)
In-Reply-To: <20181113165247.4806-8-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-8-sameo@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 14:00:55 +0000
Message-ID: <CAFEAcA9yGRH5sFeS2WWzfUpo4MoMio4O=O95PRSebq6PZ9wrjw@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 07/13] target: arm: Remove the LDST headers
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OrOGLb+aaRGD

On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> They are no longer needed.

...because a previous patch moved the code using them out
to excp_helper.c.

> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)

thanks
-- PMM
