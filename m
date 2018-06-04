Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp583171wrq;
        Mon, 4 Jun 2018 06:03:24 -0700 (PDT)
X-Received: by 2002:a9d:73d2:: with SMTP id m18-v6mr1151174otk.332.1528117403939;
        Mon, 04 Jun 2018 06:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528117403; cv=none;
        d=google.com; s=arc-20160816;
        b=u9b+lOWxvXeiaK2s40+dIzlFd+lTwey7Kw4iKLcjAD1HxqUdX0szYCnCPGY0ba4+9a
         bvYCXDPhWKtJ7S/dvgr8EkDGH1UCDsg40YiiVSU/lnDOfW+X/8DxnTiHhagQzNb5/tDx
         X5gmfi0Mqg5hvswaDphAceKmL1JGzQ5cz6vgiDHiOiQjwDtcbzaU4OAJP11qGX08jdkp
         zhk3n43gnA02oHikkFLhrZnpx9MT0/0sAQDoxU1jlU+DeWMpBmJnuLbE8PCtV2jLW7mN
         sQt33eOtDHjYntducDzRkrl8+W2nWUJKiIFfcObA7rYgWULhyD+Nh1dMZgbwU9QErU59
         n8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IPeEf2U3xQG1FGYL5r04UhLBkNt0WAj4W4uj8QuEyg4=;
        b=C3Tg7lbHwgtHjMZYxgmhfL2ttzpm4urDqEVDzRPHvTzTK2aNN6ugBZjUfxQTpylebV
         +LHzb5f48/4hkyJEvqObK0g885F89B2AEqQ4kZYNEWxF8AA/Ty2UHaWxbMoZsfB7uvag
         WiZKq7FY2tBh5Ul+gDLZBfSOy8kwpxqDyYEdNBYMA6hHWDIGu7LO6ZKtP6vfb7zqvBp0
         DuJquBl8qjXm1QETdy9s54OSf9Akngc6oaMKLCH4nQw4WU6N5alNzCps2ar6kf6sQmNe
         nTHjbtdMxwzTGRRDTTd9zH+7kuO7QuuFsMa1BX+ttYeAEOqEF2L3c3ACZLkEAMAFJxGT
         pm6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ncezua9Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m89-v6sor4385494oik.58.2018.06.04.06.03.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Jun 2018 06:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ncezua9Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IPeEf2U3xQG1FGYL5r04UhLBkNt0WAj4W4uj8QuEyg4=;
        b=Ncezua9YuJhYC0Spq4GYBN2amgxDGr4IQ/hPadTaz2JCtGlTdvyvM0mtAdD50h5TBX
         dFlBK7rv/1kw9zTV6AQ5QEZa+ntNkKMtS5k+KiiTwvwKCzK0O+fV2sOhYYLetPAyYGBx
         r8gMV/yXqRFqIVQHBCwNnLpGloM7n81qNa3k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IPeEf2U3xQG1FGYL5r04UhLBkNt0WAj4W4uj8QuEyg4=;
        b=JjdpsjfVgM0k5R0FZgycrPYiiEZEcPjqL4l9oMyi55jmaLoYWZQRO7ZW1tNMV3+bOH
         k5L2txMVprWFQmIHiYNxjTKjDwcZBvmZ7aUFhYT/DUq94q+NGGDsxBMzxVATEX7pLnLi
         mG19nbDJIL9OhN9oVR/ExMBUFLVV+F888/WuN54yl9EKU6zy4FK8EHb2SYd2ZmrFLROw
         pAtRrhUyInUPF8DmUcvX+aKlaeK83ACYVUpykgAvwX/zKZNOaB0zTyDk406GzANBYGRr
         h3eEFbAp3ySGytaJoCKVJtQkZVOZ5uUMFFryy/natr//DhPUzP4Ys9YcBNyYAKYBbDBu
         locw==
X-Gm-Message-State: ALKqPwfZz/MvvrQizrxOuhABUVVkA+v81D2fNT/o6SEmU7X2s7wOFXDu
	r3OzMEsXpbRHR51S9ebbIOeNILrKbHSVDlgPqhkCqFovA+M=
X-Google-Smtp-Source: ADUXVKJTx+wIypclzO5h2p89MMxstv0VK2eFuE1zygGpjzh6rwmNPpCdjKhIfGgTwFeRa91qMfcyfn8nzVuE9x0nhjA=
X-Received: by 2002:aca:a846:: with SMTP id r67-v6mr11971184oie.12.1528117403444;
 Mon, 04 Jun 2018 06:03:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 4 Jun 2018 06:03:03 -0700 (PDT)
In-Reply-To: <87603evivz.fsf@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-16-peter.maydell@linaro.org> <87603evivz.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 14:03:03 +0100
Message-ID: <CAFEAcA8xRj5CWkAMdUVvT_cZJWSL5ysvt8qb6fbypSp5ZJF1sg@mail.gmail.com>
Subject: Re: [PATCH 15/27] iommu: Add IOMMU index argument to notifier APIs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qrb1InhNImwA

On 23 May 2018 at 10:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Add support for multiple IOMMU indexes to the IOMMU notifier APIs.
>> When initializing a notifier with iommu_notifier_init(), the caller
>> must pass the IOMMU index that it is interested in. When a change
>> happens, the IOMMU implementation must pass
>> memory_region_notify_iommu() the IOMMU index that has changed and
>> that notifiers must be called for.
>>
>> IOMMUs which support only a single index don't need to change.
>> Callers which only really support working with IOMMUs with a single
>> index can use the result of passing MEMTXATTRS_UNSPECIFIED to
>> memory_region_iommu_attrs_to_index().
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/exec/memory.h    | 11 ++++++++++-
>>  hw/i386/intel_iommu.c    |  4 ++--
>>  hw/ppc/spapr_iommu.c     |  2 +-
>>  hw/s390x/s390-pci-inst.c |  4 ++--
>>  hw/vfio/common.c         |  6 +++++-
>>  hw/virtio/vhost.c        |  7 ++++++-
>>  memory.c                 |  8 +++++++-
>>  7 files changed, 33 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index f6226fb263..4e6b125add 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -71,6 +71,7 @@ struct IOMMUTLBEntry {
>>      hwaddr           iova;
>>      hwaddr           translated_addr;
>>      hwaddr           addr_mask;  /* 0xfff =3D 4k translation */
>> +    int              iommu_idx;
>>      IOMMUAccessFlags perm;
>>  };
>>
>> @@ -98,18 +99,21 @@ struct IOMMUNotifier {
>>      /* Notify for address space range start <=3D addr <=3D end */
>>      hwaddr start;
>>      hwaddr end;
>> +    int iommu_idx;
>
> Its a minor thing but are we ever expecting iommu_idx to ever be
> negative?

Coming back to this one -- no, we don't expect negative iommu_idxs.
But on the other hand we don't ever expect negative TCG mmu_indexes
either, and we use 'int' for those...

thanks
-- PMM
