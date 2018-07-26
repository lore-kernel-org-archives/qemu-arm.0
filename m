Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp229009wru;
        Thu, 26 Jul 2018 03:56:23 -0700 (PDT)
X-Received: by 2002:a24:d80a:: with SMTP id b10-v6mr1392762itg.141.1532602583149;
        Thu, 26 Jul 2018 03:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532602583; cv=none;
        d=google.com; s=arc-20160816;
        b=PovjZixWBxLmRHm7j/P/h1Rr04VidJrl0uOhA/+taZZNPMKcgjDxMM6iFFLmY1xNo6
         1gRor6dsi8lr+7WQQLj/+1RZ5vspohCWn/Ki0cZevdBkxmnyaaGNJFgrABa/OyTo4gNO
         U6HA9jYPZR59o+UrkR1VxYMkG84r/8vyXdsE6j7mFYVWVAkAqtQCmpD0u3IKkMu5d7Vp
         l9b7zyz6MEyF2qG6EyJyMa71mizhZz1DM8z6gPKpVdU8fU0PkUkaVp8e3V3EKuf42yxf
         o/y4Xtl/AbwRk9tk04y8dCbiRTstmatP1h1K8scXrnm2SF3dNRIrKFpOGY0bDIuzW7hD
         5eoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Y0vqNGs/muAunQ25T7na+blWfaDRMc/UlQNCeQqXu54=;
        b=XTlgm0irFli7V9f/t/YDN/Kox+jn2jsPKCeBQBgcB7sF1+5uHm/mxuYdNj1R0v3ZuV
         TFmQD544QmXGgABbbjqzJOTCWOcRVAr8ZGnt1/NuWhXljjEuivu5CNH9IlTECRowEZ1R
         WMgyJWpDpYadlElpcjynkih3PmFjG9KmJBfjo2MQvojJUEpgIfj8XAfMH3abxPBm3Mqa
         PTRrgMssaGnrFFjS8NzXtiaCcAcnUPoimUkqLRbGV6YagDdmvmYg86OqNaYlJQ3JYs8h
         280FYOimBn4gpNhAqV5ISKOmX3lNqPwopts8ASOZCVlHRzR5APftSqaFe+PWfU4qpjHw
         f7pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xi5r/EcC";
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z19-v6sor314399ioj.102.2018.07.26.03.56.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 03:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xi5r/EcC";
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Y0vqNGs/muAunQ25T7na+blWfaDRMc/UlQNCeQqXu54=;
        b=Xi5r/EcCc8ZH4Y5rHengxnekSbqNAaVLEgUSVWImeRh3EuT8zZQYE/om6JaOAB2CJh
         TSvRLtWwgArLkRlvQRXjHzuC1hbrqAvL56rtP/X8kFw30MGBXVvgwm8Hgelivruh89bL
         MP1iK20PnevSlaon/XEBRoZSkmnTyhkIXuTWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Y0vqNGs/muAunQ25T7na+blWfaDRMc/UlQNCeQqXu54=;
        b=Zxmf8e68ipTYWL3y/E5eQWEQJGESTnLH3w4Hm09MInQlfBxOn8U4GCp/q85jO4YVc8
         J3iytbVG6/MfOwRZNIAukFJu0Mv8ISzfHSiSbn6Mc9NmupSyU5hM5U/Pf5VQ3VKu6piG
         WKdiRB9YTQExZkRJHoEd6N8cbOM9w8cv8ShjoWHkfRUnNAMPPjW0qlFA3zTpRg5osA9/
         xGELdeokwds74I3g/ZiTtn0896iA5uzi0ujh6Oagyxs4iRFhK13qK5LF6y6BRYwd45Ld
         5WuoOIg1MdiiSsrks10GsTD+LgCuWHyBYyndKUucM8erLK9ciTUF/WyxD5yH55QfFtG6
         ZMag==
X-Gm-Message-State: AOUpUlEaqbWiIHIhD1rS+ZdZdeAgwCtBhAVvPI2+HkXzGVerwA5Imwqy
	X/VLvTginshFL9GEvx5/Z8sM5ATvDNIXkOb0QtwPMByw
X-Google-Smtp-Source: AAOMgpfbWYlsND3IP84zWZIskA+SWKPshbCJSZq/7/JxwNgtZ0GklkIBvZ6oH8JLgWXcOUwoNo60LuXPMF3LAj1NDgc=
X-Received: by 2002:a6b:be83:: with SMTP id o125-v6mr20133iof.173.1532602582794;
 Thu, 26 Jul 2018 03:56:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 03:56:22
 -0700 (PDT)
In-Reply-To: <CAFEAcA80549kHSO+8z334PYmoWshzz+EHJcPBxsmhBN_dk+0Rw@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
 <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com> <CAFEAcA80549kHSO+8z334PYmoWshzz+EHJcPBxsmhBN_dk+0Rw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 26 Jul 2018 12:56:22 +0200
Message-ID: <CAKv+Gu-m0=MmkaR0UGJ4mmYSNHmk9QQh06Wxx6k2wXWq+QF46w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6NkjEKDiJRcr

On 26 July 2018 at 12:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2018 at 11:46, Andrew Jones <drjones@redhat.com> wrote:
>> i440fx and q35 are specific machine types. 'sbsa' is a generic machine
>> type that conforms to the SBSA specification. If you weren't trying to
>> memory map AHCI and EHCI controllers, or if memory mapped AHCI and EHCI
>> controllers were mandated in the SBSA spec, then there wouldn't be
>> anything to discuss. But that's not the case. You're attempting to
>> hard code one instance of a generic class of SBSA machines, but then
>> just call it 'sbsa'.
>
> Modelling a 'generic SBSA machine' is not the goal here (I'm
> not sure that's even possible or useful), so let's just
> stipulate that we'll call the machine type something else
> and move on ?
>

Fine with me. Care to suggest a name? :-)
