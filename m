Received: by 10.25.221.202 with SMTP id w71csp2904755lfi;
        Mon, 7 Aug 2017 06:56:36 -0700 (PDT)
X-Received: by 10.55.186.197 with SMTP id k188mr828615qkf.123.1502114196788;
        Mon, 07 Aug 2017 06:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502114196; cv=none;
        d=google.com; s=arc-20160816;
        b=YNsFhw2Y3Md8fkX+IYZ0X4dONiwuoh+61bI4brmeN2wIbNJrXRHsn/qwYumoVZ+xLu
         c9k3CJl75vt6M5zb67vIPjPSgM565WlyuL3foCz7b/yFUPhe2vE3xiYpjsQ1TOiPU0IR
         mgbuRc1b7oWn9JyIzTt9zf63z3ZxuGHs1zBXw65S38Zp7q0njgTcQFtjKULSoojlEbxy
         aafkw4Fx4yxSgdm2i3AOPIeCJtVHbfN8C0YP9vtapNwq86Tr/OzXbwUbsiuDCZ5R5CgD
         RSHimoEjfCizBdfzS3MfO/YRo1Z2hK4Ziu1+lywWpCn8t/KUZsYA6z0Uqr7CIdW9SgT9
         EZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8dXej3yP7cfDbeEcut6dqATerhiQr9zRD7bzD2Bs4m8=;
        b=e1EysDWkroUxEw+/C+TE2oGcYoA+hKlT1e+p8csvIymKnnJECnGPolpywPEOkSGMoT
         6H1ENbejOF8VxYsOQzYFwb1mGLiZp7DOsFI7dtDVibr5R/AtcwOZDHyt11ZANiVIotH9
         PIlNYPP/VR32ffGKysbFUswV8pzvPoPnvACn5nJrIsKH1BdYYsFJ2Z2j2CJ/e0+epoTt
         LHOqDY7OKc44QOiOjosJBUkF+yzkFDe7dBPWdxOCk697ZqXSJpwXcnA0/RfQmLdKZySM
         kerh5GuGc1J5zB7E6DfTlCJk7QGCf/HZu82cjobwdDFEuKjW710tbEyrjEC4KEJLPKsG
         oa7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=LaPyCMYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a58si7276688qte.299.2017.08.07.06.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 06:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=LaPyCMYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1deiWI-0000Qh-AJ
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 09:56:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1deiW7-0000QB-FD
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 09:56:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1deiW2-0000f9-Gc
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 09:56:23 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36025)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1deiW2-0000eF-Al
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 09:56:18 -0400
Received: by mail-wm0-x234.google.com with SMTP id t201so7865658wmt.1
	for <qemu-arm@nongnu.org>; Mon, 07 Aug 2017 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8dXej3yP7cfDbeEcut6dqATerhiQr9zRD7bzD2Bs4m8=;
	b=LaPyCMYlbl9INfHEPE5jlGHxJCXDBSYQXYgRN/N5TpUsRBrsLBvwM7+Wzihwuoc4jT
	kS0psDGHDB/q1rL5InZ5LLabyk97+EyvAFfPsj2dUnj7IFwo+LDOHvdfj0a9TedtFipS
	21V1AiRwq537Gj02cuoO66oXAGbkA2ZfDF5pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8dXej3yP7cfDbeEcut6dqATerhiQr9zRD7bzD2Bs4m8=;
	b=R5uUblgWm89aaoG4cCqhmVUY/CftYESpb2REXlgVyZRM6CaAybRvmx1bH8Ai8IKDlX
	J999+y97jeZcz5MfxarGn4H95l5vCSe4dEm7CqgNkRVYkk6G6rkwMiSTAXu70vkDkPsw
	qRr+I+b17lNveCrwEbpfHBNNhu6M7yiNUgDlVl7I8thCh/W73/yCMTBGENGU+20ypj7Z
	MK+eoi47fAc27RghZ/LfxixSy/ncit0i4sYl2xkGmymxvgMAH8Rg9Cf5asN2d0i1/Hmy
	44oTzKxMqtFtWYdSc0/8vxk9Ua/Fk3CC9nnBibyp5ZsBPl03zJ/eHpfUuUgD+3lbBbzv
	6QKg==
X-Gm-Message-State: AHYfb5hctioKzdFhK9X2f22Z7ceT1FOg6eCRPoMhF0aJoFy+EB7xh5+O
	X5U7Ngt5s1Lax0K/u0fVU57SB+JYtLZ6
X-Received: by 10.28.71.91 with SMTP id u88mr507057wma.108.1502114176945; Mon,
	07 Aug 2017 06:56:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 7 Aug 2017 06:55:56 -0700 (PDT)
In-Reply-To: <20170807121410.2h5k6duxw7aia3ow@kamzik.brq.redhat.com>
References: <1502106581-11714-1-git-send-email-eric.auger@redhat.com>
	<20170807121410.2h5k6duxw7aia3ow@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Aug 2017 14:55:56 +0100
Message-ID: <CAFEAcA-=2LdOOyFgi9DXdUvG3JUD326AFmRbeRrcQgPSgKwwuQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10] hw/arm/virt: Add 2.10
 machine type
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cQZBWoQSkwGX

On 7 August 2017 at 13:14, Andrew Jones <drjones@redhat.com> wrote:
> On Mon, Aug 07, 2017 at 11:49:41AM +0000, Eric Auger wrote:
>> Add virt-2.10 machine type.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---

Applied to master, thanks.

-- PMM
