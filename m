Received: by 10.25.77.65 with SMTP id a62csp123407lfb;
        Thu, 2 Feb 2017 04:48:43 -0800 (PST)
X-Received: by 10.159.36.39 with SMTP id 36mr3984256uaq.146.1486039723321;
        Thu, 02 Feb 2017 04:48:43 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x22e.google.com (mail-ua0-x22e.google.com. [2607:f8b0:400c:c08::22e])
        by mx.google.com with ESMTPS id 46si6599777uas.12.2017.02.02.04.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 04:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::22e as permitted sender) client-ip=2607:f8b0:400c:c08::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x22e.google.com with SMTP id 35so10316128uak.1
        for <alex.bennee@linaro.org>; Thu, 02 Feb 2017 04:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nUJ6L/PBXj9BW0UPfQftc0sUH/FKwISKcROlyHI7ye4=;
        b=GfIjwDTJTPl83QXfpwBiXCSaf+qEwPxnP/MyaFLE6qleQIdd9kKqSRfjlEoOT8m0Br
         jWVWKpEngFe6syHhM4UGbtxG37LnFbdXnlh7nShNQKwuOvNzDcJwDtRYryeJfahs8uSH
         dFdWsmgpahW3TT5K2k/0X5H0awLDywhh+mjfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nUJ6L/PBXj9BW0UPfQftc0sUH/FKwISKcROlyHI7ye4=;
        b=iHYTVEc64ONvyo1yq77rHkcNsSQQhmU0tNvPDIK6PpQMiS9Ex5xOh28fauA0uTESGw
         AAKLX6TUnKFhMByLAqvCXNSEZRQw85rvtsqvb3JuYYtsB2ht+ZXe619db/Cb7h5WY+a2
         6yKesNRVtAWNNHSqNgv6lu/ZtpANaBgHrKyzUX2ZJOmMsQbKRnoHWIAVKt76ptewY+va
         BRezEsR58JK1ONQixPG1RcYQkOoacUQoOHFe8Jz+KXzybToQUhw8/HSyd5VXyMP6JosV
         xvZ6dvcrd4Dqi/FcoFibNiTJYNZ/N3NIqrBUDTzpk4UGhCoXqP0seH9OvXeun25sI1LI
         TnaA==
X-Gm-Message-State: AIkVDXKlAIVVx5zyWiW5UUbtv0nOpQR83FHR7BahCIMOb3lZF9Yrmm8cHHJxgUsik8xlE3y5BzSQ7dsFZ/sK5+a8RbM=
X-Received: by 10.176.1.174 with SMTP id 43mr3942843ual.44.1486039722922; Thu,
 02 Feb 2017 04:48:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.69 with HTTP; Thu, 2 Feb 2017 04:48:22 -0800 (PST)
In-Reply-To: <87a8a44wi9.fsf@linaro.org>
References: <CAFEAcA9j47hSCHyYh5TzNh5P-V3_ddcmA=XMcini+d8PnqruZA@mail.gmail.com>
 <87bmuk4zyb.fsf@linaro.org> <CAFEAcA_vxpT+rErpPBmyst+g71KassD-N2755yyY8TvW6S2Y=g@mail.gmail.com>
 <87a8a44wi9.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2017 12:48:22 +0000
Message-ID: <CAFEAcA_NWwQGjXwEMpYBwV=CH_CcmQNhjnXunQMQYNvPFbR0Tg@mail.gmail.com>
Subject: Re: [PATCH v8 23/25] target-arm: introduce ARM_CP_EXIT_PC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Claudio Fontana <claudio.fontana@huawei.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KCzd69WEP36V

On 2 February 2017 at 12:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> Your longjump is effectively skipping the normal "end of the TB" code,
>> which is what usually does the set_condexec for you. At the end of a
>> TB the expectation is that everything's been sync'd back to the CPU
>> state structure.
>
> Hmm so as long as the tlb flush helpers don't set ARM_CP_SUPPRESS_TB_END
> things should just work normally?

If they're register writes, yes -- we end the TB on writes but not
on reads (on the assumption that only writes might modify state that
requires a TB end). If the TLB instructions are reads then we can
add a "force TB end" flag.

> Is shouldn't matter if the TB with the
> flush is chained to a new TB as the exit_request test should fire before
> any more state changing operations happen?

I think so, but again if you know that you're always going to exit
the TB then there's no point setting it up so it might chain.

thanks
-- PMM
