Received: by 10.25.21.96 with SMTP id l93csp514225lfi;
        Thu, 16 Jun 2016 15:03:40 -0700 (PDT)
X-Received: by 10.107.62.4 with SMTP id l4mr11190307ioa.185.1466114620761;
        Thu, 16 Jun 2016 15:03:40 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com. [2607:f8b0:4001:c06::233])
        by mx.google.com with ESMTPS id m71si178392ith.36.2016.06.16.15.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jun 2016 15:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4001:c06::233 as permitted sender) client-ip=2607:f8b0:4001:c06::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4001:c06::233 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-io0-x233.google.com with SMTP id f30so54418026ioj.2
        for <alex.bennee@linaro.org>; Thu, 16 Jun 2016 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qUnWpp6ah2NIlv7xqlNMU1sSzIVOWhWvoAvN9eVHBRM=;
        b=jV5947FKD6qwun4y1zth+Mmke5Fb8aLweZ0kyM6GbpcsZOauJ024NW6OMuXlTmunyu
         VJ03uszYuvU0NtzTGBRFcQTekVt4aYJhMuyAs3DJMHgeIdbvAu6kmI8eApFbuxo7jBSz
         cuOlHzkaaLK2QtPypCuATyhgn/8E/3vJ2NEsSKIrruy79/7onnslEiwcYjCrcPYu/sXO
         +N8n69wF0wFQIy4bQO3lzRdwipi5l2wkUpR0Xdybj4rDTDLNsuJPEADNq8tBvF3U9aSL
         /wAZcRGxPSlwVXau0NTRPlNXtnNG5AlYbMW4tkmAy2jwfwmFaZlWlUZp3BgshvMPlAqg
         Q4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qUnWpp6ah2NIlv7xqlNMU1sSzIVOWhWvoAvN9eVHBRM=;
        b=Xa5t8CCrrUVpMd12lkw2ZWcSkICcf46Rf/1QFr7Vz0q21iqdLSfeCEr0OR1bqsKMyZ
         kFeiJnQdKl9CxAGMackVm0+/rptr1ApNZUDUb2ZEhnCtIoCjqxbHdPYMj8F+CV5r8OzX
         lwE8KRVYSrfkOP1BV5qQucbYUDpgzb0z9XynoR48BLiOv7slm5Poyzbr8ToR57CESSLq
         peuhFuvpkPR1acX/Ftz9hVxRE0/et/DJbrqWuSzdYC77IHunSk6wbQvAb1bvWfgYkpbD
         4MjqGEZQJYx6EWhaTn+g3EXRy2vQ2JmCKxeDNeTZR/QnMvedc+eOse6KK2o2XIkgdOYn
         zV9Q==
X-Gm-Message-State: ALyK8tIykgjRObNFwrRNaKtYOpL9SfbeYlpgmR0tLBv+Jp4W+iEytGMUI6MDqzeuQgcoroj0XkIanOWt/TVhsg==
X-Received: by 10.107.20.17 with SMTP id 17mr11355277iou.155.1466114620420;
 Thu, 16 Jun 2016 15:03:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.62.4 with HTTP; Thu, 16 Jun 2016 15:03:11 -0700 (PDT)
In-Reply-To: <6685558a-6774-778f-a8c6-b6e845eb5ae4@twiddle.net>
References: <20160531183928.29406-1-bobby.prani@gmail.com> <20160531183928.29406-4-bobby.prani@gmail.com>
 <6685558a-6774-778f-a8c6-b6e845eb5ae4@twiddle.net>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Thu, 16 Jun 2016 18:03:11 -0400
Message-ID: <CAJhHMCAcrnBYZCh83KeJ-6UB6oWLwEei0cXSJ-fez4crO7DZ4w@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 03/13] tcg/aarch64: Add support for fence
To: Richard Henderson <rth@twiddle.net>
Cc: Claudio Fontana <claudio.fontana@huawei.com>, 
	"open list:AArch64 target" <qemu-arm@nongnu.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Claudio Fontana <claudio.fontana@gmail.com>, Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: of7LPoJnBraH

Hi Richard,

On Tue, May 31, 2016 at 4:34 PM, Richard Henderson <rth@twiddle.net> wrote:
> On 05/31/2016 11:39 AM, Pranith Kumar wrote:
>>
>> +    /* System instructions.  */
>> +    DMB_ISH         = 0xd5033bbf,
>
> ...
>>
>> +    case INDEX_op_mb:
>> +        tcg_out32(s, DMB_ISH);
>> +        break;
>
>
> With the flags argument, this needs to be split.
>
> DMB_ISH = 0xd5033b8f

I just checked this. Shouldn't this be as follows:

DMB_ISH = 0xd50338bf
DMB_RD  = 0x00000100
DMB_WR  = 0x00000200

The logic seems to be ok.

Thanks!

> DMB_RD  = 0x00000010
> DMB_WR  = 0x00000020
>
>         if (a0 == TCG_MB_READ) {
>                 a0 = DMB_RD;
>         } else if (a0 == TCG_MB_WRITE) {
>                 a0 = DMB_WR;
>         } else {
>                 a0 = DMB_RD | DMB_WR;
>         }
>         tcg_out32(s, DMB_ISH | a0);
>
>
>
> r~



-- 
Pranith
