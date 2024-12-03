Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3750609njk;
        Tue, 3 Dec 2024 07:00:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUdoCUhteHGLDhSiYg6W+8bIVuMWHmyg+6IlwH3f4qVinNt1LYHYljvF4MnlpJhQt06Bp4qyLGm3CYPPg==@linaro.org
X-Google-Smtp-Source: AGHT+IGBRzQvfvC8CKu8sYCS7/luw4iOhNormrq9MgW56jqLRKAoM6BOP2NOZPhsIt2vavUHyvpW
X-Received: by 2002:a05:6e02:1448:b0:3a7:99a5:a207 with SMTP id e9e14a558f8ab-3a7f9a35c7fmr37713585ab.5.1733238046361;
        Tue, 03 Dec 2024 07:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733238046; cv=none;
        d=google.com; s=arc-20240605;
        b=Qw+A4nk6rwNtp5IL7i6uJ7HfQpXMH5F33ABOCcH3IneeFx/nv/GyyFkztVsPLvO3j4
         XZb1fzO3BLtTjN7N/q63ILSnEEdDPJlCrsLu0IjQqgM2X9q5/EokWEOUDSwdhomQIPa0
         D6wdNswpuEn+0rZ6nXZwfXmYtt2CNSYmzjaT1XrRW0GEm1XEbiG9EZrvq/DLiVxi+A55
         VEkd8l75sEE6iWbcEtYywHHf+s7u10wiTKTs8rOD3g5HDoj8cgQFeMa5Q9tnA8Z3LryJ
         MkuRe27b3QggF4rJyqzYjW+9b39MF9cWx6rG1Bqp0WZxynRzQdKPwIFks/g0Z9CxNm5c
         ir3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6J2Y4dfnIHsQ9ZpXC/tv6YlmpgFNyGD4pllzESmZSFQ=;
        fh=bFv0Jmnut8X/20Cjjg9uLOT5MXnoyRyNuNZfE5f/e40=;
        b=BqwdTaYzL8yEqVhD4dhUoDQxFyqq9WM1uzBGxPjuOKES9THb68Uhi2oxiHGrLUhL3W
         kkBQuEXYJ4wFRu8opwn9KyK0NQH3wis2IBjBt5CxBe0i+gLEKm5yaWeP3j8qNP+f3Ovk
         FA70KY7tcF5VgJwpHIiyDxXfWHqSMyYa0RMCJr0HE1+ZFP4XCi6Z4w6+3e8lVvtmOK3B
         cduIu4h5Bfufin0Ghsgs5c7jog5RNdNl7QXuFNEZEdwN41IIypbngZ1Kp1anLI6+ADTy
         O6hc1ryCWOiRgDASXyxKU9yIRA6I7bGg3rWkXbvmoAS6pd2DEXBT+SWONMytY2gBHyhd
         CStw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RboratJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684d10f99si1479532085a.60.2024.12.03.07.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 07:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RboratJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIUOC-0007Ku-PL; Tue, 03 Dec 2024 10:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tIUOA-0007Kh-Rs
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 10:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tIUO8-0003Kv-AB
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 10:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733238028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6J2Y4dfnIHsQ9ZpXC/tv6YlmpgFNyGD4pllzESmZSFQ=;
 b=RboratJxQgorO4xPLG4Tk4OVpRLCACSLCQGH6v+7NHiwaTlLEoI14IMh4TsG4sYrgw3bOa
 o5wnFAZN3KBHgANh0+OkNrzvoPN5oIxSH+eqCfWWEnzgc8mn0vi1ujtBzNBUsSR1AUpwC5
 fY1Kq1SRSFsT8vWBkYTJedhrClZMMRs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-tq3Cv3rKPumXl6bsiafRsQ-1; Tue, 03 Dec 2024 10:00:27 -0500
X-MC-Unique: tq3Cv3rKPumXl6bsiafRsQ-1
X-Mimecast-MFC-AGG-ID: tq3Cv3rKPumXl6bsiafRsQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e5e3bf60so2232766f8f.1
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 07:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733238026; x=1733842826;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6J2Y4dfnIHsQ9ZpXC/tv6YlmpgFNyGD4pllzESmZSFQ=;
 b=UivTHnCoYTSrMcReR8U9OqzscIvJ8CJ2vkD8zrL8KrhcxDoyetSSNkEpGHfYec/MyF
 strZXUO3xzvjBP0xGLPArMjD2nnbarrsMQNjcWvcBLpFFSMA4WEJJozi7ISd4oWVa6Xa
 h5dup2pzLZTtpOLUEwgGvtQSL+wAnGL3y1rS+NR3sRaIcMahAT3cPc+tAEoF4GfY5M9y
 mxfilpTaKQePUkwqxFPwoLaodtlKTPKHAsGmzy84iwNJWKWvnNErCWdEJo6byrCIFnkZ
 qiTS7eQiW7Lzr9NxlAhfXxwQKEW0HJk/GnWoZZtmCZYkwLG7FSH0NLR422RYYsJOG09V
 9JgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXnoAg9voqjS6POzSxL9yv8EoMf2mxIs7PcdpEJmz5Fj/FYd/dolDl+V5N1MzlJEy6HxPAh446WQ==@nongnu.org
X-Gm-Message-State: AOJu0YweK2d7jOffoWn3xY3z2VOFVUP0T/vaHKCISkdkqwC10qeoWGVt
 qiJ6YyydBpy4EX+adNO7zn17RYfHXeRurAMTvyg4qrFu5npDgJIFHTZJssHUVjcRG2Do0Bg/mtp
 am8MXaSh39ye+r+LAQWpel+uNrjImtJQAi0i4SeeLWVlWlF0o2A==
X-Gm-Gg: ASbGncuPtZPuOxDMtayKrMrR4DGwUCShin+pR83Jquo1MaRohsyvqels0Qzs00L71jO
 NnrA+bPm1xy1Nm4ogsg4MKx1H9pvJZMXL7Tme1589nUNUI7msqwFtvExPBTaIXc1WJ0llGLa8pt
 qvVIW85iJtRrIoP2oAoR5Cbl8SlpBWtLlfkTmMK2u2BTxJGy5Y+SCA/QqHY7W6YhoHgTnmKWl4Y
 JaD8eBophb6yBM2/yVGc7chEbK77xfbnIBAX8qeg1QebeFiaW1EAkMmFLSvUm/gRDPRxM4LLtrR
 0iFwzPfI2ul0tti3QYUSJuPQpqr5v56xKiwwYgJTOpCxc72o4h1Qy/dMqwCecD0Pov4F8ASoAWY
 Eww==
X-Received: by 2002:a05:6000:1faa:b0:385:f7d9:99f5 with SMTP id
 ffacd0b85a97d-385fd433612mr2335768f8f.51.1733238026157; 
 Tue, 03 Dec 2024 07:00:26 -0800 (PST)
X-Received: by 2002:a05:6000:1faa:b0:385:f7d9:99f5 with SMTP id
 ffacd0b85a97d-385fd433612mr2335711f8f.51.1733238025584; 
 Tue, 03 Dec 2024 07:00:25 -0800 (PST)
Received: from ?IPV6:2003:cb:c746:1b00:fd9e:c26c:c552:1de7?
 (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de.
 [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa74fec9sm222965495e9.6.2024.12.03.07.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 07:00:24 -0800 (PST)
Message-ID: <fcf373b2-cb33-4764-a2bc-c95a0d76710b@redhat.com>
Date: Tue, 3 Dec 2024 16:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] hugetlbfs memory HW error fixes
To: William Roche <william.roche@oracle.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peterx@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
 imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <cf587c8b-3894-4589-bfea-be5db70e81f3@redhat.com>
 <20241125142718.3373203-1-william.roche@oracle.com>
 <48b09647-d2ba-43e5-8e73-16fb4ace6da5@oracle.com>
 <874e2625-b5e7-4247-994a-9b341abbdceb@redhat.com>
 <e09204a4-1570-4d39-afc7-e839a0a492d8@oracle.com>
 <753a033c-7341-4a3a-8546-c31a50d35aff@redhat.com>
 <31693f78-dbef-4465-9c8e-a68a25cb4af2@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <31693f78-dbef-4465-9c8e-a68a25cb4af2@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J_2hXyXCxDaPdMlLbXpyXzSPh9clQEEsC11_ymnOzaA_1733238026
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hy8pFhkr6TzR

On 03.12.24 15:39, William Roche wrote:
> On 12/3/24 15:08, David Hildenbrand wrote:
>> [...]
>>
>> Let me take a look at your tool below if I can find an explanation of
>> what is happening, because it's weird :)
>>
>> [...]
>>
>>>
>>> At the end of this email, I included the source code of a simplistic
>>> test case that shows that the page is replaced in the case of standard
>>> page size.
>>>
>>> The idea of this test is simple:
>>>
>>> 1/ Create a local FILE with:
>>> # dd if=/dev/zero of=./FILE bs=4k count=2
>>> 2+0 records in
>>> 2+0 records out
>>> 8192 bytes (8.2 kB, 8.0 KiB) copied, 0.000337674 s, 24.3 MB/s
>>>
>>> 2/ As root run:
>>> # ./poisonedShared4k
>>> Mapping 8192 bytes from file FILE
>>> Reading and writing the first 2 pages content:
>>> Read: Read: Wrote: Initial mem page 0
>>> Wrote: Initial mem page 1
>>> Data pages at 0x7f71a19d6000  physically 0x124fb0000
>>> Data pages at 0x7f71a19d7000  physically 0x128ce4000
>>> Poisoning 4k at 0x7f71a19d6000
>>> Signal 7 received
>>>      code 4        Signal code
>>>      addr 0x7f71a19d6000    Memory location
>>>      si_addr_lsb 12
>>> siglongjmp used
>>> Remapping the poisoned page
>>> Reading and writing the first 2 pages content:
>>> Read: Read: Initial mem page 1
>>> Wrote: Rewrite mem page 0
>>> Wrote: Rewrite mem page 1
>>> Data pages at 0x7f71a19d6000  physically 0x10c367000
>>> Data pages at 0x7f71a19d7000  physically 0x128ce4000
>>>
>>>
>>>     ---
>>>
>>> As we can see, this process:
>>> - maps the FILE,
>>> - tries to read and write the beginning of the first 2 pages
>>> - gives their physical addresses
>>> - poison the first page with a madvise(MADV_HWPOISON) call
>>> - shows the SIGBUS signal received and recovers from it
>>> - simply remaps the same page from the file
>>> - tries again to read and write the beginning of the first 2 pages
>>> - gives their physical addresses
>>>
>>
>>
>> Turns out the code will try to truncate the pagecache page using
>> mapping->a_ops->error_remove_folio().
>>
>> That, however, is only implemented on *some* filesystems.
>>
>> Most prominently, it is not implemented on shmem as well.
>>
>>
>> So if you run your test with shmem (e.g., /tmp/FILE), it doesn't work.
> 
> Correct, on tmpfs the test case fails to continue to use the memory area
> and gets a SIGBUS.  And it works with xfs.
> 
> 
> 
>>
>> Using fallocate+MADV_DONTNEED seems to work on shmem.
>>
> 
> Our new Qemu code is testing first the fallocate+MADV_DONTNEED procedure
> for standard sized pages (in ram_block_discard_range()) and only folds
> back to the mmap() use if it fails. So maybe my proposal to implement:
> 
> +                    /*
> +                     * Fold back to using mmap(), but it should not
> repair a
> +                     * shared file memory region. In this case we fail.
> +                     */
> +                    if (block->fd >= 0 && qemu_ram_is_shared(block)) {
> +                        error_report("Shared memory poison recovery
> failure addr: "
> +                                     RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
> +                                     length, addr);
> +                        exit(1);
> +                    }
> 
> Could be the right choice.

Right. But then, what about a mmap(MAP_PRIVATE, shmem), where the 
pagecache page is poisoned and needs an explicit fallocate? :)

It's all tricky. I wonder if we should just say "if it's backed by a 
file, and we cannot discard, then mmap() can't fix it reliably".

if (block->fd >= 0) {
	...
}

After all, we don't even expect the fallocate/MADV_DONTNEED to ever fail 
:) So I was also wondering if we could get rid of the mmap(MAP_FIXED) 
completely ... but who knows what older Linux kernels do.

-- 
Cheers,

David / dhildenb

