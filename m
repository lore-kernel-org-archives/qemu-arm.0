Received: by 10.28.71.155 with SMTP id m27csp2563426wmi;
        Mon, 9 Apr 2018 06:35:49 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/M1YvrKUdF9yKiI0hscvwUi1ewBy95vAdx62S1JH28kwtIv8dTtyGD1yPJc49qNJY/zzJ6
X-Received: by 10.200.113.196 with SMTP id i4mr22897328qtp.186.1523280949676;
        Mon, 09 Apr 2018 06:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523280949; cv=none;
        d=google.com; s=arc-20160816;
        b=i4+q/nRjPNs7VGmqFZ9vXHILtALiOd8qMdQ3G5inr5RjvCVhHkq1E/ZCgEnNE5oPIA
         bg1EwN+xTXwZDfYz2fwlT0a97i7o2qkycgkj4D8NZARIKH/TADpLpx9hER8ueJrcjDRl
         mTdsmzQLnEZZ/H56SE4i+n339cgU6pC/Pmf13k7MObqIHAqOkwkhaYANOgWSOLH0wUAH
         17aYlGMDzo2AefudSaWYjYNtnblvB1hZ7F3RjK8s8tJyMqU63zdkmgMdPgF4YQCxjiUX
         Mrf7tRbQGxheb4gNRYvJkJPwtEc9vFq92/foeV9D7bnTPE3iG0TjsGATTa3DqieD4MHF
         r0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=hjn57fHAnn3Nha89UUchrlYj6RMVAPnbYI9l6MUSJiM=;
        b=hfd9RqTDz8rNN8URGM2rn7cfdDoRgXwklo7KIY0cXtM8uDoHZE1sDcMhUFbjHijclX
         9S9gYvF/VuhIKBLm1lGh8wIPg1qO6GFsJJReJZsoj5ZA1VrhZmv90OVtnjMGoiprXg3Y
         9wIhEegz0DCeFLal1zutxGB8PjNuVFjcOEiHtlydJlCw7FcNALSHBIZCopAy+yDhvZFH
         u5dIY5uamqBJM6P60AzTWyVcRbwiWX0EpCPzRdMQtivRq1pSi7cXa8OWyv4OM7NzqpV+
         b/MuXcove480UcD5/x+z5lbtgAjEpkO4VyNjqwmrV0aZOmBgoeEUyckzjSoaw1XLnPfW
         7y4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FUwfYO3/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q11si388394qtn.109.2018.04.09.06.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 06:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FUwfYO3/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5WxZ-0002XH-6v
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 09:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5WxQ-0002WD-6o
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 09:35:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5WxP-0003z5-FV
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 09:35:40 -0400
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f]:34868)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ajaygargnsit@gmail.com>)
	id 1f5WxP-0003y0-6t; Mon, 09 Apr 2018 09:35:39 -0400
Received: by mail-lf0-x22f.google.com with SMTP id j20-v6so6606537lfk.2;
	Mon, 09 Apr 2018 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=hjn57fHAnn3Nha89UUchrlYj6RMVAPnbYI9l6MUSJiM=;
	b=FUwfYO3/jENBT9WjJVxX8l2UKb3Z37AnabJ0hfyAlFtlH+igSCPtdxls7/ireA0VzU
	FpN5F1eHwzCLUxCzzTX1eBbUDr0+Tuxk2qsN9I6b9OP89TM6msPmQm8O9GOlvsO0jEn5
	ZzdbqOMJDhLCOKRSLgPgErHP9EVpW3PMVzoSNxUvJiZDSbfufIdbSNXzWbK6c8Pl3/jp
	qgdHGf1kTAqJ3b38MFyHsSqkwnyjs7TgZfAGKbQyghjIglewOecLuT4lQqq6izXspX67
	M/1p86/8pUJ9t2UFo7Dzo1QZWOj0BVqcgTkxB2Uj6NIMGKVKQ4jLC3Dy3MhXX4i+JNwu
	Z77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=hjn57fHAnn3Nha89UUchrlYj6RMVAPnbYI9l6MUSJiM=;
	b=WJXcFVyokZDZZUiV+UG+AsmSiaJiOJCT3AQNUo1HprDHyVzkcOeecmT8kzsYq1+k5V
	WJrWJpAIAU2/Px9+L3j8dMo8jjmZELTUW9fzZh09xyHSVUJlbykyKsKEqAqtL4aRPmRQ
	OhKGaUmVoAK3o5G/Ee7g5pj8K8qpyaQn2VHa/DZV+KW1GDTVzyb40ylFQIt1oRTvDcS8
	GqbSVDMBmv/fgADxcIn3vMS6HTdyXRbEaLJ3EOhg2CZ+FD5FI0DYOiu/oevj2s7dm2uC
	+mtwodR6Gh802eUa451ZW7Q89mWAYXwe6XAvBKSjDTGry1OeJfp82UgbAPa0bQMOzrvq
	OXFQ==
X-Gm-Message-State: ALQs6tB63Or/VdQKyVQsxjDIYjqKbE31rTGeUFLdFwiHMdt7/yFB7RiU
	WlMB5cxK/RDJ49CbQ5Ij923s1FblEJJEDdX82lXePQ==
X-Received: by 10.46.158.137 with SMTP id f9mr23285888ljk.113.1523280937361;
	Mon, 09 Apr 2018 06:35:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 06:35:36 -0700 (PDT)
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Mon, 9 Apr 2018 19:05:36 +0530
Message-ID: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::22f
Subject: [Qemu-arm] Use of -machine when running via qemu-system-arm
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JiPJBYtAkC7F

Hi All.

Not sure if this is purely an ARM-related question, but I will be
grateful if someone could point to some literature that explains what
difference choosing a  machine makes (when we don't need to have any
such flag for qemu-system-i386 or qemu-system-x86_64).

I am sorry for the noob question.


Thanks and Regards,
Ajay
