Received: by 10.25.44.15 with SMTP id s15csp3542539lfs;
        Mon, 31 Jul 2017 05:12:47 -0700 (PDT)
X-Received: by 10.237.34.75 with SMTP id o11mr20784945qtc.299.1501503167588;
        Mon, 31 Jul 2017 05:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501503167; cv=none;
        d=google.com; s=arc-20160816;
        b=vWG1eatVYkT0n2/MsouC3r+4gedZMXW8iuIpOEcyT12mkl3FY/DF2XYxUOqqRR/+lN
         iM8QaQ2PaP8mToWV6PiJGVJOteYYPH7kI9n/Ig6avAZ4EK8TVvkLuypj54QA0i8gIAZJ
         avK6o66A7zajlsp2vCCkFQDJYg1kolooN9P791XjQ0Cl8W+5S54qBAKKOYgIEi9OdHUB
         s6He9QZ1J7hKxvn3p7GG6GD316g/nXem6rPnyBqGIIhf/az7BvomLFX03dOXw/927CWl
         uA28cTwfYRRYZXZ8yPtzsXIqG7X3xHY7lrmG9Dopev9MaKLH5QJwolD41AC7zxsxcuI2
         tybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jued0RB6HvNTgJ2FaLgYgQHlyrq8IKdosEfgmQqrSoc=;
        b=BpFY4xQrWMTu5WHic8jGzWuxC2SSW2Wa4GA5Emj6eeaRlKJwk2JtcS0ZJ4odNaNNJs
         9HtNXhbmt4noDQ6QeFkuTN04hupvkQ+T2I33AVfyVNhGjcaSu6jm7ruxJq4x8ioesHR9
         0op4jhUp7MPs/FVMr1vNWnzLWiNvxN5sj/KZux8Mtr7NAKYgUaQbP2UgQ6nqP9eBi24e
         hFNYK/L3aXsJp8Pk4Ju/PhOb46LMC84iKMzctk+2NxRT2+iMTkFMp6YkpO2kwyfgDDOW
         pooj6kgcVEfvV7ox4iJTehu5TUsaAhiX6TM1jl8sJzUjxK8LkAEG/K3aBf+ibP+9Uqo+
         p3YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=MGAbr1FZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123si2056269qkc.218.2017.07.31.05.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 05:12:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=MGAbr1FZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dc9Yy-0006mW-Uu
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 08:12:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9Y8-0006Tb-1x
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 08:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9Y7-0004jd-8O
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 08:11:52 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:35903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dc9Y7-0004io-1x
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 08:11:51 -0400
Received: by mail-wm0-x230.google.com with SMTP id t201so177469193wmt.1
	for <qemu-devel@nongnu.org>; Mon, 31 Jul 2017 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jued0RB6HvNTgJ2FaLgYgQHlyrq8IKdosEfgmQqrSoc=;
	b=MGAbr1FZ5GCkhYRAuASS/S6Qtse5T+wD9ZWsZ5bW1CXa9QxzyB88/lyARxNIhKEDCe
	zDyi17J1I2fnsumiRjWuXTaYLAaYJv3nWDefw2RtCFyHEJTAYhWW+bVUqfYYZD2ZF5TC
	wcXQmj264RskuSUH8aPAcyMbDtrhRupLtSPvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jued0RB6HvNTgJ2FaLgYgQHlyrq8IKdosEfgmQqrSoc=;
	b=bNtAO/+ZLJVAGNVQ1IB0rYkXzUbWnGi0/kBvmky0fYbbVCpA/ImHRwkkRFBdQf8X84
	S0//KbONLlU7W57/TYeUR/pq0DAOvsOc6lByWOOIlFDnWuw2iSHNd6KA5HGQg364nhk2
	tX4By6oSdUuVJCxpcjimLON5xi7QI4iQQGIQdvQ0M3kpVe8cyvlWX12P6PqOJ52L5r5v
	GqerzNjEewawBE/3nNHUVvi+5ouQkzScxVZOX3xHU4WKQYwYTjtlum/05EQm8cpnZUnP
	qtn/KRBT//pKHVi22AMCRkrQsy1UT4c//OSHW8+QuXEu3NUdP0rZtGmB2iwFlFL//NIM
	jJNw==
X-Gm-Message-State: AIVw110TdxO28ddG7zZU832EAoenK8yS//GaqZlmS2TQWxG4f4ARrtBi
	fkuyrMiLpvu+CxUaejMRiM9MJ0mBUAKV
X-Received: by 10.28.198.206 with SMTP id w197mr11714729wmf.86.1501503110092; 
	Mon, 31 Jul 2017 05:11:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 31 Jul 2017 05:11:29 -0700 (PDT)
In-Reply-To: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jul 2017 13:11:29 +0100
Message-ID: <CAFEAcA8yQ27yei8OMNwQGrVsp2_=mR4LPP5u2A6+LDFNtX++-Q@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-2.10 0/5] M profile MPU
 bugfixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mlxipdih2TCy

On 27 July 2017 at 11:59, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset fixes some bugs in the M profile MPU code:
>  * the guest shouldn't be able to make system space executable
>  * PPB region accesses should not be subject to MPU lookups
>  * we were not resetting the PMSAv7 MPU state for M profile CPUs
>  * we weren't migrating the MPU_RNR state
>
> The renaming from cp15.c6_rgnr to pmsav7.rnr is not strictly
> necessary for 2.10, but it doesn't affect many places in the code
> and it restores the invariant that no mutable M profile CPU
> state is stored in env->cp15.something fields.

Applied to target-arm queue for 2.10, with the minor function
renames (s/is_/m_is_/) suggested by Philippe.

thanks
-- PMM
