Received: by 10.25.77.65 with SMTP id a62csp98579lfb;
        Tue, 31 Jan 2017 15:37:27 -0800 (PST)
X-Received: by 10.84.212.2 with SMTP id d2mr43381027pli.152.1485905847107;
        Tue, 31 Jan 2017 15:37:27 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com. [2607:f8b0:400e:c00::241])
        by mx.google.com with ESMTPS id d84si17323358pfb.266.2017.01.31.15.37.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2017 15:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) client-ip=2607:f8b0:400e:c00::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pf0-x241.google.com with SMTP id e4so30175619pfg.0;
        Tue, 31 Jan 2017 15:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=J6XZaW/0YEnJ0MTnNGH404LYUtfd5bC+gGbMUniSGzs=;
        b=sbdyH09r5ku1BCs52aSzplAmwCxS6fSBmVdT6Tq+qaDAqzL7ZULK0H/R4Ex3ABLInn
         Nn22NfpeWqNPgtUJpmf+rbCdsr3gr1CPZ/YaUJKBMHjHOVPoFKZNBmpOKmj/oacJLXOv
         xfVo/176fAxqtXBflK08//HfnVxqmAU52PgNp+g7IuDMpmW36rlJ4LvBDiGgT1LCaZs5
         lIBTrebjym2zfWdEp3w/RkVXgofS2wbi4MIBTL0zm5LAudOu3uhO+SYkxLPHvI/QXnp+
         jQYINzgxVAMf1hzeRdr9+9/waKs/EfagAQoeOzso2HY9lqZBhl7CueDjIwstEZ4mUzZe
         izkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=J6XZaW/0YEnJ0MTnNGH404LYUtfd5bC+gGbMUniSGzs=;
        b=eNjugvqdqZqGSKO0/mYDXvM8fJo0OAklmmbVdxema6a2aCn2R945cN53WzVkN/hLyF
         WtJu1YYJFoLVDuYCqtomAWdosmacEgpFg2zDv1vwkAs5RcMA3GwgmE0zVdgJNasKpH5d
         280csf/b1rEzCpnsSeHSZB618bkNfB3DhJXuIdpjiyR3b8q2nHBuQX5erjnMNtxRYfxM
         +zJgvjMnt7Egkxj6VvuS7L2CgYLD00jE2B1vWmZGvdg8mHb+yPiWDD0kyNn9kssKOvQy
         by1YaenlUn9BXlBOFyMws1AedvT7bW3jIimPc4CR1ulGM/HaNxU8eJtdl2763xYKfjGS
         I+sA==
X-Gm-Message-State: AIkVDXIQZWvomJaiAKLBMAId/jMkNYIW9VMlL/2b4SrnTxOJnkdDFvlceGpEc7SZiQ2Kzg==
X-Received: by 10.98.41.5 with SMTP id p5mr32611831pfp.183.1485905846653;
        Tue, 31 Jan 2017 15:37:26 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
        by smtp.googlemail.com with ESMTPSA id f3sm44247728pga.34.2017.01.31.15.37.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2017 15:37:26 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v8 24/25] target-arm: ensure all cross vCPUs TLB flushes
 complete
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com
References: <20170127103922.19658-1-alex.bennee@linaro.org>
 <20170127103922.19658-25-alex.bennee@linaro.org>
Cc: mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com,
 serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com,
 bamvor.zhangjian@linaro.org, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d929bbf5-3dbf-0816-9a45-8b0203689a96@twiddle.net>
Date: Tue, 31 Jan 2017 15:37:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170127103922.19658-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VazXqBNq+ZGY

On 01/27/2017 02:39 AM, Alex Bennée wrote:
> Previously flushes on other vCPUs would only get serviced when they
> exited their TranslationBlocks. While this isn't overly problematic it
> violates the semantics of TLB flush from the point of view of source
> vCPU.
>
> To solve this we call the cputlb *_all_cpus() functions to do the
> flushes and ask it to ensure all flushes are completed before we start
> the next instruction. As this involves exiting the cpu_loop we need to
> ensure the PC is saved before the tlb helper functions are called.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
