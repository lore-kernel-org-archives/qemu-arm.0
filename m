Received: by 10.182.105.169 with SMTP id gn9csp1088315obb;
        Mon, 9 Nov 2015 02:59:54 -0800 (PST)
X-Received: by 10.13.225.81 with SMTP id k78mr26998734ywe.343.1447066794626;
        Mon, 09 Nov 2015 02:59:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x22f.google.com (mail-yk0-x22f.google.com. [2607:f8b0:4002:c07::22f])
        by mx.google.com with ESMTPS id m81si7162849ywd.192.2015.11.09.02.59.54
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:59:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22f as permitted sender) client-ip=2607:f8b0:4002:c07::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by ykfs79 with SMTP id s79so28798015ykf.1
        for <alex.bennee@linaro.org>; Mon, 09 Nov 2015 02:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Um6B+2OXGMEjtWToRZ40OHGW+p53fsVIme1pJSiEBV0=;
        b=17FbeX+40hdO7ekTANCNs3F0oBQoJ9eFfHuBPq93dsLNgkCnnY1aQBqtZf4SuxvWcx
         icU5pN/+FyYS+DIOKyYgy2VCap7XF83CpLoUp93DnA/VD2riTp7a9n5a76hqyG2aDKw8
         Vcn/mSfuzzhHa8ELd7PVuPUKxj6v+SMSvDu+wHEYJ5VuoxwcQBi+R5a0VB9bxYJn0Xbo
         mSrhUAHkeR7e/NMxQePb2tBc2gVuHIfTPe320xOz5/oWVi0lFxyHVFn8xs547+BdEkNo
         QQwIm/3tN7BLBPBVGQ2JTD8M6txdl8hYd4clL8dzKbSOGArvNkz5sT92oZ7lCxy83jJO
         ZxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=Um6B+2OXGMEjtWToRZ40OHGW+p53fsVIme1pJSiEBV0=;
        b=RhBjRWSy3v4SbMtGVzEDIu3eOFZdFzmL5B0KCgiEpIzIOmLaDzqvnkaGPfUxFp1x7l
         51bDqylGpegltYsPXfzRD22KlJAgO47UYKtLxDnyDsbgExGbSKSSDBMd+wPD7byWHZkz
         std3bjOSkSrc2j/xnBqAtUR2MqGtM/LV4LpUOpujZ4pDfjixdNg2RcT20ZRUTO2839tD
         DUc5XkYen+/5S886LKKLxTneYmDO5RvM+0Y1U7szighAN/7DswCNUr3R/ek03FU4kXQM
         QlWLgySOVwzvgeagJ5cJLi2lzrUQ4AuZbZPzqIxTWXVB0dvzq7zx653kvW4yVjIPcEJG
         DQPg==
X-Gm-Message-State: ALoCoQnfxPCJxstar6SHFpL2mj5OyLgVmU2I1VPJGV3yFFQZXWy6xLKC850On5INQez1AsgGcqyS
X-Received: by 10.129.57.133 with SMTP id g127mr22019161ywa.105.1447066794360;
 Mon, 09 Nov 2015 02:59:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 02:59:35 -0800 (PST)
In-Reply-To: <56407BA1.3070304@redhat.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-12-git-send-email-peter.maydell@linaro.org> <56407BA1.3070304@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 10:59:35 +0000
Message-ID: <CAFEAcA-Ss35K8B2MfYTEjgi3RMyRPqsiZmJzoLq9sBbQO=gybg@mail.gmail.com>
Subject: Re: [PATCH 11/16] memory: Add address_space_init_shareable()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: SIdIQO3XibGC

On 9 November 2015 at 10:55, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 05/11/2015 19:15, Peter Maydell wrote:
>> +AddressSpace *address_space_init_shareable(MemoryRegion *root, const char *name)
>> +{
>> +    AddressSpace *as;
>> +
>> +    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>> +        if (root == as->root) {
>> +            as->ref_count++;
>> +            return as;
>> +        }
>> +    }
>> +
>> +    as = g_malloc0(sizeof *as);
>> +    address_space_init(as, root, name);
>> +    as->malloced = true;
>> +    return as;
>>  }
>
> You shouldn't return a non-shareable address space here, I think,
> because it might be contained into another object and that object might
> disappear.  I haven't thought this through very much, but adding an " &&
> as->malloced" to the conditional seems easy and safe.

That would prevent sharing the system address space, which is one
you really commonly want to share. I guess we could make that one
be alloced-shareable.

thanks
-- PMM
