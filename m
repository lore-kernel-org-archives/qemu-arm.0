Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp649613wre;
        Wed, 23 May 2018 04:53:02 -0700 (PDT)
X-Received: by 2002:aca:538b:: with SMTP id h133-v6mr1333671oib.252.1527076381907;
        Wed, 23 May 2018 04:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527076381; cv=none;
        d=google.com; s=arc-20160816;
        b=nO6w8rhf47LjqfiqGWEKDbc4dDjBAiuFsoi8sIeM+ZsigUQioy2Pi7nrpZRPpcYnrz
         jGgEJpvK3Hu3zbV0LWg+7hhzRdIoHsHdT4mn3EiIB8n5YfABp0W5LcGBFnNas9OpbjMd
         IylbXcYlltld9R8xewinGovC8ny/Un8kgyTJf50EisR+KgPcDjQVHOvhCsU/cngUZw02
         pHy0ZbBwIfrDk/0HLQt08mgfYfiprkhlwOou8b3oYcCBqjUz6BWuMi7/IXggd+noR1Zb
         jPSwwGAHZO96O3p22X1GzSdS5uhg2A2dN5YcW2RW9GSEu7Hsk6eJvts/aHPAamGpv+v4
         2fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=s1CmKQwtgkSeX5wGRhn42zxw6PUQdmhbaBOd+AEIsDQ=;
        b=rbDg37B21VRCMUVZkffVRoSGFYt+q58Iptz+rbphuBggsdk56+t9BGBJz9At7Kh/WK
         CkFOdXiVZOMJzMes1ER/H70anGoG5MaO8xhuujmgVOKV2lE2DY8PLb+z65ya2flE39oV
         BKopQt1wiqJ+LCkyt/A5nk53xSzBujkCztk1rz9izbQ4A2Uhrfl1g7dGopwp5p18g6rW
         HM6pt7DU7Vhm/Hz8p6JrOurmKxNaZ9Xi/3IRjScDor0djCXH/2gOzkuxSiN+WS0NClZZ
         6kG50X9boJoLsorPTnaQLxG5ivaao42y1fnzuJxl2ZeO3XJTdlzlw0H3VUQ0MOUqy9iD
         JEaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H15hEocZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i35-v6sor8952961ote.325.2018.05.23.04.53.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 May 2018 04:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H15hEocZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s1CmKQwtgkSeX5wGRhn42zxw6PUQdmhbaBOd+AEIsDQ=;
        b=H15hEocZcHvZtIjG5o31WrEdVg63sZM+29Sm+4ytSoLNp5hJP4l8mjv/O3pFsLvRaw
         av2R+IbJWlh0Q19dXDhAgc8n+oem7y6JIPD0glcxDo7ontc9JflwIZvqUs2tH65RVV8x
         pJbUvHq4Gs9r394Pv06/DQoPogqcDV98XpwQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s1CmKQwtgkSeX5wGRhn42zxw6PUQdmhbaBOd+AEIsDQ=;
        b=Br60+ElM6l+74vLAi40dOjXjczbOpfN50xTXYwzV0Ty02rx1NhHkqdrJ4qH9uwfYH2
         07iURz5ng9MzKwQZfPHdM/AksGeP638bz9ALAAx2OAGDus96yxSM/UGDUkE326Io144T
         rrcdj64BR/PVo9kfZC4hAjYKaPnkDNTibieH1hSlEffWCLILrN2qJ7ifmKf8rwkRsYtg
         4WGhNwaWoefG2+vFVqaHEyEBXoGZJy6TgfkuzQUsgJWQgVam1maQAJgS5idGTFA5QK6h
         gVVI79ftogjnymlmv3tH3gm8Mjbw7KdxZ4eMwD5gY6IsdddnDGRw7LT78Rimq0YM8vtu
         avFg==
X-Gm-Message-State: ALKqPwd89RwhGv22OfouIwVlkN+GpRgU+EVOenHJqgzTodFuahMtVfmj
	w/rh+yTM10crjpliQdFlO0EkhhvZz9jHnZCKFWbUUdxRi5k=
X-Google-Smtp-Source: AB8JxZp61D08LJ2wbERJAhkbWYR7DEYk1kghkssKzy3fAmdGwOsvxHSM0vueK2wCUdZAa4bK6DlwfcbalVFte77tMwI=
X-Received: by 2002:a9d:2625:: with SMTP id a34-v6mr1575811otb.308.1527076381395;
 Wed, 23 May 2018 04:53:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Wed, 23 May 2018 04:52:41
 -0700 (PDT)
In-Reply-To: <8736yivgw3.fsf@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-18-peter.maydell@linaro.org> <8736yivgw3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 May 2018 12:52:41 +0100
Message-ID: <CAFEAcA-dzhUsTW+_+VPZT5W4ArvDi5hEs7jAnmdLzEod9=Bc4w@mail.gmail.com>
Subject: Re: [PATCH 17/27] exec.c: Handle IOMMUs in address_space_translate_for_iotlb()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wgSxWEOoeLvm

On 23 May 2018 at 10:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Currently we don't support board configurations that put an IOMMU
>> in the path of the CPU's memory transactions, and instead just
>> assert() if the memory region fonud in address_space_translate_for_iotlb=
()
>> is an IOMMUMemoryRegion.
>>
>> Remove this limitation by having the function handle IOMMUs.
>> This is mostly straightforward, but we must make sure we have
>> a notifier registered for every IOMMU that a transaction has
>> passed through, so that we can flush the TLB appropriately
>> when any of the IOMMUs change their mappings.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/exec/exec-all.h |   3 +-
>>  include/qom/cpu.h       |   3 +
>>  accel/tcg/cputlb.c      |   3 +-
>>  exec.c                  | 147 +++++++++++++++++++++++++++++++++++++++-
>>  4 files changed, 152 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 4d09eaba72..e0ff19b711 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -469,7 +469,8 @@ void tb_flush_jmp_cache(CPUState *cpu, target_ulong =
addr);
>>
>>  MemoryRegionSection *
>>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr=
,
>> -                                  hwaddr *xlat, hwaddr *plen);
>> +                                  hwaddr *xlat, hwaddr *plen,
>> +                                  MemTxAttrs attrs, int *prot);
>>  hwaddr memory_region_section_get_iotlb(CPUState *cpu,
>>                                         MemoryRegionSection *section,
>>                                         target_ulong vaddr,
>> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
>> index 9d3afc6c75..d4a30149dd 100644
>> --- a/include/qom/cpu.h
>> +++ b/include/qom/cpu.h
>> @@ -429,6 +429,9 @@ struct CPUState {
>>      uint16_t pending_tlb_flush;
>>
>>      int hvf_fd;
>> +
>> +    /* track IOMMUs whose translations we've cached in the TCG TLB */
>> +    GSList *iommu_notifiers;
>
> So we are only concerned about TCG IOMMU notifiers here, specifically
> TCGIOMMUNotifier structures. Why not just use a GArray and save
> ourselves chasing pointers?

I don't have a strong opinion about which data structure to use;
but GSList has a "find an entry" API and GArray doesn't, so I
picked the one that had the API that meant I didn't need to
hand-code a search loop.

>> --- a/exec.c
>> +++ b/exec.c
>> @@ -650,18 +650,158 @@ MemoryRegion *flatview_translate(FlatView *fv, hw=
addr addr, hwaddr *xlat,
>>      return mr;
>>  }
>>
>> +typedef struct TCGIOMMUNotifier {
>> +    IOMMUNotifier n;
>> +    MemoryRegion *mr;
>> +    CPUState *cpu;
>
> This seems superfluous if we are storing the list of notifiers in the CPU=
State

You need it because in the notifier callback all you get is a pointer
to the IOMMUNotifier, and we need to get from there to the CPUState*.

>> +    int iommu_idx;
>> +    bool active;
>> +} TCGIOMMUNotifier;

thanks
-- PMM
