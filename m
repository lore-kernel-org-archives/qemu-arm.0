Received: by 10.25.77.65 with SMTP id a62csp1158796lfb;
        Sun, 29 Jan 2017 12:42:38 -0800 (PST)
X-Received: by 10.55.147.198 with SMTP id v189mr17948480qkd.194.1485722558287;
        Sun, 29 Jan 2017 12:42:38 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 96si8151366qtc.34.2017.01.29.12.42.38;
        Sun, 29 Jan 2017 12:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 52AD440A7B;
	Sun, 29 Jan 2017 15:42:21 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5r6XVaUkrWa; Sun, 29 Jan 2017 15:42:20 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6264A408EB;
	Sun, 29 Jan 2017 15:42:20 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E33DC40625
 for <kvmarm@lists.cs.columbia.edu>; Sun, 29 Jan 2017 15:42:19 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNPboLiuX1t5 for <kvmarm@lists.cs.columbia.edu>;
 Sun, 29 Jan 2017 15:42:18 -0500 (EST)
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
 [209.85.213.46])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 902C140296
 for <kvmarm@lists.cs.columbia.edu>; Sun, 29 Jan 2017 15:42:18 -0500 (EST)
Received: by mail-vk0-f46.google.com with SMTP id r136so205358616vke.1
 for <kvmarm@lists.cs.columbia.edu>; Sun, 29 Jan 2017 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FHVpmYlJtNlkulbwhwFTQSgU8qjZlevIQjCr4P87kd0=;
 b=VeKBccj06plOC3ajJR0CioSmYIVoLAJS0DZY9+FA6ObdJb4RLQBMfsNWuWuK5JWKCG
 2Jv540o0TqBEhgCcnOQQiUaXlGtwlwflKqf+pF2/koJ2y7mc+i+X6VfMQqJS5PuPvAra
 QV48IEd2XcsRTwn/2U6gTQpJawMxFWk7smumc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FHVpmYlJtNlkulbwhwFTQSgU8qjZlevIQjCr4P87kd0=;
 b=U3r9vydEHqu6bvS3KcVB6MnyIMasotcA1Zv0V2o5pMy3JRiZczcM8PnNXaMI/AP+oM
 E8vniBRfSq2jcXQ+AYXD9ukpCQaS/jwFFUurJw/Yw0gWUvvAngirixii2pst30E/iNDO
 Gp6wn29tl/vuZxKxI3H3YMoISemYoYB1abTIgB4P9TBO/f6KbkvwQfRUp3SnPlJ+x5bL
 OUZhOh3dc0Wp212KSb5LSh+oWezXEGo1zbxxRC8fxoS7FbO54LaJNHD0W5sd1IM9OdlA
 53Wps/JPvXCKN18SepESouVl3jL57ifxE2+VcKxgTnbiZCB0ZR30hDsv44qVdXec79VS
 Uh5w==
X-Gm-Message-State: AIkVDXLc0wlqhEbwr8ULMN8H6BGKd1E+vSy0A3V9jrqD7c+2SVdOD748dwfUHsXini/dkdLWnx44bczhZS339RNF
X-Received: by 10.31.62.71 with SMTP id l68mr8944660vka.175.1485722554570;
 Sun, 29 Jan 2017 12:42:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Sun, 29 Jan 2017 12:42:14 -0800 (PST)
In-Reply-To: <20170129115306.iuhvofl3y65x7sjw@hawk.localdomain>
References: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
 <1484558821-15512-4-git-send-email-zhaoshenglong@huawei.com>
 <20170129115306.iuhvofl3y65x7sjw@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Jan 2017 20:42:14 +0000
Message-ID: <CAFEAcA-nB7uQAGcZWUYeiAis2tY33U6yeiig+kwd2-KRD=KSuw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH RFC 3/6] arm: kvm64: Check if kvm supports
 cross type vCPU
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 wu.wubin@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: GKjYKG195QIR

On 29 January 2017 at 11:53, Andrew Jones <drjones@redhat.com> wrote:
> On Mon, Jan 16, 2017 at 05:26:58PM +0800, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>> +    memset(id_regitsers, 0, ARM_CPU_ID_MAX * sizeof(struct kvm_one_reg));
>> +
>> +    id_regitsers[0].id = ARM64_SYS_REG(ARM_CPU_ID_MIDR);
>> +    id_regitsers[0].addr = (uintptr_t)&cpu->midr;
>> +
>> +    id_regitsers[1].id = ARM64_SYS_REG(ARM_CPU_ID_REVIDR);
>> +    id_regitsers[1].addr = (uintptr_t)&cpu->revidr;
>> +
>
> We can condense this nicely with list initialization
>
>  struct kvm_one_reg id_regitsers[] = {
>    { ARM64_SYS_REG(ARM_CPU_ID_MIDR), (uintptr_t)&cpu->midr },
>    { ARM64_SYS_REG(ARM_CPU_ID_REVIDR), (uintptr_t)&cpu->revidr },
>    ...
>    { 0, 0 }

"registers", please :-)

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
