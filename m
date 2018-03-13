Received: by 10.28.91.67 with SMTP id p64csp966670wmb;
        Tue, 13 Mar 2018 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt564lIRmj9CBiOMv4Hw9f58xx+G0ftkQZ9RlvFu6I+S6hsxGvFmZQDEYj3RgqTtdu4ikqj
X-Received: by 10.55.245.14 with SMTP id l14mr2106140qkk.301.1520961958278;
        Tue, 13 Mar 2018 10:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520961958; cv=none;
        d=google.com; s=arc-20160816;
        b=j1I1c7EdCS71+41uKos7T4xfrpFNTrwF6E+np60/GoyBVpdGkVCXDMQj70Wk6s+4ww
         pUDVPMuqYGjMa72q4nYyVn6zuvljnlXFP5EGjD1jds+q4xsS2HjMpHd/MdIiktTWZZww
         qCI8lmMc8bE7Jlig485CDOoUpp7grdoKU4efZJF10qhDDsRd0Lyn0x+O6Ss4Gi1eQEtp
         GF5eH2hQtj2deDzRLl7q9OPyRTNFimwBywKaaIxo+k9gpjkp6iaVbrhkRXN0w/MNzlFd
         fK8E2flffcuZ3xb3NcUM4/bToE0ikcmeC8M2exmoL8f+5fsk9KI15jY1Sv7pgazE3bV4
         +FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pjrWR3nAqpJJeP+MUUf9UenJ4gcEn0+l8niJRY4DFDU=;
        b=UYHRk3VK24VoCAqRgPpmJela1pfqpgWd0EUMlK+x6Pw8CnE06ydnaTVSYmWW8aU7Eo
         6s21L0q6b5oBnx+wBuxSxiwJMdrRQcnZux9vCoPSd864RS30CP6XfNFep1AEbykJweUU
         KlfzJ1m5We54TJS4nSk7PdDzuvQtiIDjtqDCIka+WOBIa6nPExr5m5zyeULj44bV4rgi
         fN7uMWTtFxsVhKq1wwD0/u1wnW1GMufStkenDl3oWVNvYTNbS5NwR3ibZsS8Rf6t9JCk
         iV1DswSLXqP9t1R/OElXXQZ4vMxYhnYYHkW/QpxrauyViZAQbmDE5LyfbVISTXn3EfJG
         wf3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X/G1biRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f94si613770qtb.284.2018.03.13.10.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:25:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X/G1biRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evngT-0000nt-Kg
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:25:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evnO9-0001eS-3b
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 13:07:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evnO8-0004RA-54
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 13:07:01 -0400
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:42831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evnO8-0004Qj-08
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 13:07:00 -0400
Received: by mail-oi0-x236.google.com with SMTP id c18so284911oiy.9
	for <qemu-arm@nongnu.org>; Tue, 13 Mar 2018 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pjrWR3nAqpJJeP+MUUf9UenJ4gcEn0+l8niJRY4DFDU=;
	b=X/G1biRuHJ6+U5Y4ZxiTzemLPoN2xC1bpx/FTt65pOchfvNNw1O7SJ1b3q8e83AAor
	0hZsabtKTF6GSTWkMQwS8KIdRLVJay8+DZ+nOkOjJFMlWrd826ckpEeg6RfY2EvAFpvM
	74LYiU6Dvv9d+wLZYSnaV6KDwKxzGXzczrOQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pjrWR3nAqpJJeP+MUUf9UenJ4gcEn0+l8niJRY4DFDU=;
	b=icIwtrO2E5WgLNmPb0SC10QJwrIwfuJ8GT/QUxAvB4/mqCLkE6oIvBAZgF/9SP8YoJ
	4beGpsUP2nBPJcrPm0RHZO9/k2ocllUluk3arUt8P/TWZ2CO5Ht2js2YbG5dJoyuXilY
	c6DZwaEAnTfZSMbau9dvBooiwv9rl99gnXl5xCUnBy/yq0T60v/8X1iypA9D+FwvzXyQ
	Z281j/VfRxtUA+qLSxKS/Gcl9eXd2yY6n4EhOjzdy91chFHeK3yEkDBI1zFZDfQTZvC/
	Z33TaRBF7BivQJ1Nitx/HpfGRk72fhKG04hxiVTIkE9rE3fPQAdOWQsdI/LeO4P+ca/d
	GtYQ==
X-Gm-Message-State: AElRT7EeEQqmwlnAlAxJ1B9WHu6G2zPsgfHCKHFj7oA8zAtUyEWPIn8X
	Ux8UQ/6pPA6vw3lTAn4eRUHu4DMdyX7RxLm8nl83Zg==
X-Received: by 10.202.95.68 with SMTP id t65mr937124oib.102.1520960819442;
	Tue, 13 Mar 2018 10:06:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Tue, 13 Mar 2018 10:06:38
	-0700 (PDT)
In-Reply-To: <MWHPR21MB01894A8E274ED18E666D43019ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-8-peter.maydell@linaro.org>
	<MWHPR21MB01894A8E274ED18E666D43019ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Mar 2018 17:06:38 +0000
Message-ID: <CAFEAcA_KQJQdfTWUfihdesXL12_Xbi8nPCaZ9=Djwz_GvYaFew@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::236
Subject: Re: [Qemu-arm] [PATCH 7/9] hw/arm/bcm2836: Use correct affinity
 values for BCM2837
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
Cc: Pekka Enberg <penberg@iki.fi>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlpwR5UxZzX2

On 13 March 2018 at 16:48, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Maydell <peter.maydell@linaro.org>
>> Sent: Tuesday, 13 March 2018 08:35
>>
>> The BCM2837 sets the Aff1 field of the MPIDR affinity values for the
>> CPUs to 0, whereas the BCM2836 uses 0xf. Set this correctly, as it
>> is required for Linux to boot.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> @@ -119,7 +124,7 @@ static void bcm2836_realize(DeviceState *dev, Error
>> **errp)
>>          /* Mirror bcm2836, which has clusterid set to 0xf
>
> The first line of this comment should probably move or just be deleted. It's not relevant here.

Yeah, simplest just to delete it.

thanks
-- PMM
