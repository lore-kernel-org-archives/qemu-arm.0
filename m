Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7665384njc;
        Tue, 12 Nov 2024 14:07:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1TP8hE8+9WEkGRreINMrfGVCPo8U42cFvz9nnzFLU1uRM5NmLgf/kERtSYgdri92ZtQCkiIGgCWf/MA==@linaro.org
X-Google-Smtp-Source: AGHT+IG3n9BRYBd+xrMds1hn2sWHQ+GcuKXnk3fJbGV1CLH2ClwErYq8dCeNQ/u9Ys7YLHB4Xz4Q
X-Received: by 2002:a05:6214:2c11:b0:6c4:6217:da9c with SMTP id 6a1803df08f44-6d39e117f93mr278276926d6.17.1731449228664;
        Tue, 12 Nov 2024 14:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731449228; cv=none;
        d=google.com; s=arc-20240605;
        b=hjyKVhu6oHCXz+XJL+aR2/Dv1TAec2Z1fqR160dtZyi2TaVb4A9dxC9NC+aDQRGDkr
         5+Id6KfcxzojpzG4GLR6qtx3crfXvTHbL7pZordrMTVWM+3Z2tutqjdOVgOcwa57oxc0
         BDraWAk2qnvIxfvIWb4Mr6mGrFfgYb8Hs1pRQCdBAhu8X+OskrqtHHQLWvXXHOV/g6L1
         5uroKJ8eOP5oYpfllnAQZK5+atVnvExrfFiQUcP4VGlZSJ/OM9yc1ZkPjPXwu7fsUEkl
         0NPV06qBoI5/OpolTOC1cv/0JH+ixUk9HnCr7RPX7JR7fm6biholzFDxubWy6Y5QfDa/
         S6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ahnn79TADEjKAzoyWfeCGkoaSmp2qpuLj1GWLCV4zsc=;
        fh=gwNMG8NNNHMu2eq1+sG7IT62k2AbIXyme+HVUfS46QA=;
        b=SYkkONiDrTByQuoahAW0m96HdU7W6fUyGebDbge+wwUYmnq9qZy7O2HY4RQ0E8Wc0a
         /h3wZ6Q05HHZwUAHtJxobxx4NdVekAntx0zGRl0N6j1FWo2VhH6Akehhnq124kDKD2Vq
         lho5bcWx7g6Y0OuZYKjy7mMslFChjscz5hNZfcN/RSiajKvq6nXzPON8dWfIUGdTNCAx
         fGdizn2739zzLcsMbr1Xcn4mJHKmP+UvR1axGDcltqp5fBRlszKqhq9WwMroANrw6G8P
         f78fTrejBSQa3vKLWS9sBt7X6FWmAo63kD4mDiw9LkzXA6aX0XZYyIw6OiOCvPqv2AmL
         jL6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsFXtKpb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966bfc0dsi149035076d6.504.2024.11.12.14.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 14:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsFXtKpb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAz25-0003nI-6c; Tue, 12 Nov 2024 17:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tAz21-0003n1-4C
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 17:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tAz1z-00089R-Bl
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 17:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731449198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ahnn79TADEjKAzoyWfeCGkoaSmp2qpuLj1GWLCV4zsc=;
 b=VsFXtKpbMTF4yo4Gt6K3xlPFuitbwlVMbdl8jflCtu4/PZvRv1BvvTRsDY1oPrdo2dFeOx
 GWof7kRJz39Qt195OIKkaNB//e2UX5RTw2EiQKVS+hFJdgmnesNo+fsgK4xT9Nr1308QDw
 fmJF+QCvxD44VDixe0fRylB4xJmOf9M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-Nct2T5TIMcKAlTqa2VTN9Q-1; Tue, 12 Nov 2024 17:06:37 -0500
X-MC-Unique: Nct2T5TIMcKAlTqa2VTN9Q-1
X-Mimecast-MFC-AGG-ID: Nct2T5TIMcKAlTqa2VTN9Q
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d52ca258eso3165715f8f.3
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 14:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731449196; x=1732053996;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ahnn79TADEjKAzoyWfeCGkoaSmp2qpuLj1GWLCV4zsc=;
 b=Xin1Lm8LxCTNbMvwW7qAjFfkWZ3NIk6NT64lvzIuLVnIUNvpLzpxO/7QlPsRM2YN54
 elvE51kLBymN0KjdjhliEFQzd6fk6bJy/J6jsfKl990AjEtv/2dP3e161grX64mhHybQ
 Ov2mRrFQCvcjjpMdbIMCGcZyJl1YMvzSS8GMRtmlQHzWYG5UEV4yXTiyAlWN3gAO8aUg
 QSUBR5S2VtUiwJK1OHa0ade4PHvfzxUzopp1hwDhavqPZZIZLDdruX21qlCvKoeECaOY
 o5tewyfgiqiN+rzf8lmeOpJjaRERwVFAQCoSjaoV4CIH5KYpiOeei/aXBzixhTwTGvfz
 AGxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGvqo41HGwRDTl3FFgwx2z0YLxEH5V+pWRkburzK58Y2DGhvnUJmbn2riERUA34Raxn9MGcr7X0Q==@nongnu.org
X-Gm-Message-State: AOJu0YxLZcgv0fReVCaVsFn7Ux5bYWVI9Cqjuxm9i0h4BJwfh4VEpffg
 8kf8fipJm4V4eq7i5JgqJhXne831TGSYaFzDISfq9tj5mvwbVyLnA5bl0HsYfXrInbl06pY68Zz
 adAt1Hd6P/NWqly0NN39FKh3aiM6Vnwl/s9yu/vJZWgUkOr6xhA==
X-Received: by 2002:a5d:6d8e:0:b0:37c:d12c:17e5 with SMTP id
 ffacd0b85a97d-3820811217emr3588748f8f.23.1731449195605; 
 Tue, 12 Nov 2024 14:06:35 -0800 (PST)
X-Received: by 2002:a5d:6d8e:0:b0:37c:d12c:17e5 with SMTP id
 ffacd0b85a97d-3820811217emr3588720f8f.23.1731449195206; 
 Tue, 12 Nov 2024 14:06:35 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:8e00:7a46:1b8c:8b13:d3d?
 (p200300cbc7398e007a461b8c8b130d3d.dip0.t-ipconnect.de.
 [2003:cb:c739:8e00:7a46:1b8c:8b13:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d55417f3sm793925e9.34.2024.11.12.14.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 14:06:33 -0800 (PST)
Message-ID: <fb1529d9-4c92-4bdd-8dae-404a49cfd7b3@redhat.com>
Date: Tue, 12 Nov 2024 23:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] system/physmem: poisoned memory discard on reboot
To: William Roche <william.roche@oracle.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peterx@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
 imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <e2ac7ad0-aa26-4af2-8bb3-825cba4ffca0@redhat.com>
 <20241107102126.2183152-1-william.roche@oracle.com>
 <20241107102126.2183152-3-william.roche@oracle.com>
 <b0e80857-b9cb-4e93-81bd-93e8dc4b1d51@redhat.com>
 <a79a2639-a6f1-4ca1-9b12-d4e125d894d4@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <a79a2639-a6f1-4ca1-9b12-d4e125d894d4@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LqlzY3nWu-D2AXn7zy3s7S5fIllZS03tsp8V3sTgdC4_1731449196
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 92R3ST65Z5kT

>> For shared memory we really need it.
>>
>> Private file-backed is weird ... because we don't know if the shared or
>> the private page is problematic ... :(
> 
> 
> I agree with you, and we have to decide when should we bail out if
> ram_block_discard_range() doesn't work.
> According to me, if discard doesn't work and we are dealing with
> file-backed largepages (shared or not) we have to exit, because the
> fallocate is mandatory. It is the case with hugetlbfs.
 > > In the non-file-backed case, or the file-backed non-largepage private
> case, according to me we can trust the mmap() method to put everything
> back in place for the VM reset to work as expected.
> Are there aspects I don't see, and for which mmap + the remap handler is
> not sufficient and we should also bail out here ?

mmap() will only zap anonymous pages, no pagecache pages. See below.

>>
>> Maybe we should just do:
>>
>> if (block->fd >= 0) {
>>       /* mmap(MAP_FIXED) cannot reliably zap our problematic page. */
>>       error_report(...);
>>       exit(-1);
>> }
>>
>> Or alternatively
>>
>> if (block->fd >= 0 && qemu_ram_is_shared(block)) {
>>       /* mmap() cannot possibly zap our problematic page. */
>>       error_report(...);
>>       exit(-1);
>> } else if (block->fd >= 0) {
>>       /*
>>        * MAP_PRIVATE file-backed ... mmap() can only zap the private
>>        * page, not the shared one ... we don't know which one is
>>        * problematic.
>>        */
>>       warn_report(...);
>> }
> 
> I also agree that any file-backed/shared case should bail out if discard
> (fallocate) fails, no mater large or standard pages are used.
> 
> In the case of file-backed private standard pages, I think that a poison
> on the private page can be fixed with a new mmap.
> According to me, there are 2 cases to consider: at the moment the poison
> is seen, the page was dirty (so it means that it was a pure private
> page), or the page was not dirty, and in this case the poison could
> replace this non-dirty page with a new copy of the file content.
> In both cases, I'd say that the remap should clean up the poison.

Let's assume we have mmap(MAP_RIVATE, fd). The following scenarios are 
possible:

(a) We only have a pagecache page (never written) that is poisoned
	-> mmap(MAP_FIXED) cannot resolve that

(b) We only have an anonymous page (e.g., pagecache truncated, or if the
     hugetlb file was empty) that is poisoned
	-> mmap(MAP_FIXED) can resolve that

(c) We have an anonymous and a pagecache page (written -> COW).
(c1) Anonymous page is poisoned -> mmap(MAP_FIXED) can resolve that
(c2) Pagecache page is poisoned -> mmap(MAP_FIXED) cannot resolve that


So mmap(MAP_FIXED) cannot sort out all cases. In practice, (a) and (c2) 
are uncommon, but possible.

(b) is common with hugetlb. (a) and (c) are uncommon with hugetlb, just 
because of the nature of hugetlb pages being a scarce resource.

And IIRC, (b) with hugetlb should should be sorted out with 
mmap(MAP_FIXED). Please double-check.

> 
> So the conditions when discard fails, could be something like:
> 
>      if (block->fd >= 0 && (qemu_ram_is_shared(block) ||
>          (length > TARGET_PAGE_SIZE))) {
>          /* punch hole is mandatory, mmap() cannot possibly zap our page*/
>           error_report("%spage recovery failure addr: "
>                        RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
>                        (length > TARGET_PAGE_SIZE) ? "large " : "",
>                        length, addr);

I'm not sure if we should be special-casing hugetlb.

If we want to be 100% sure, we will do

if (block->fd >= 0) {
	error_report();
	exit(1);
}

But we could decide to be "nice" to hugetlb and assume (b) for them 
above: that is, we would do

/*
  * mmap() cannot zap pagecache pages, only anonymous pages. As soon as
  * we might have pagecache pages involved (either private or shared
  * mapping), we must be careful. However, MAP_PRIVATE on empty hugetlb
  * files is common, and extremely uncommon on non-empty hugetlb files,
  * so we'll special-case them here.
  */
if (block->fd >= 0 && (qemu_ram_is_shared(block) ||
     length == TARGET_PAGE_SIZE))) {
	...
}

[in practice, we could use /proc/self/pagemap to see if we map an 
anonymous page ... but I'd rather not go down that path just yet]

But, in the end the expectation is that madvise()+fallocate() will 
usually not fail.

-- 
Cheers,

David / dhildenb

