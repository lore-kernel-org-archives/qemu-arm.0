Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp645123ejb;
        Wed, 15 Feb 2023 08:17:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/bkHWT3Y+Iv+CL8QaOPmC+5x0y5qQMi0OmoBZ8ZUdn9Z9afFJoNzkC9mr9dmBL/mT+drQN
X-Received: by 2002:a05:622a:134e:b0:3b9:ed95:6ac9 with SMTP id w14-20020a05622a134e00b003b9ed956ac9mr4028432qtk.23.1676477836767;
        Wed, 15 Feb 2023 08:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676477836; cv=none;
        d=google.com; s=arc-20160816;
        b=l3BHWivrJl7+0xPkOF328rcHXMS8B0aZNjb7qnAYq8O9zXpe1hIHPOn31jK9UqM+p4
         tvFUCqheDTjxFi76uYXlqJEzvS+LavJr6P/aS1WV/Q65sXv+gHy4HVeoqWLj5Z4b41S0
         yIp3qQ0b1E0YY2YYYdnhF11NMiGXnKzVs84BVPF5suiBNZIKV8I8wGf6jRVm09bRQhYB
         m1apIzO/WfHwEEJxqtmjzw/pC93+L84Usas5LndZ4ff5X5QmOnsHlFXfrj7cLe4sO7Uz
         zxRJBPDVripvVMrl22kHOBZKut27wX7xmpXThwwLEDE80wk9F0f+ky2r+QqlaZD+LmQi
         jH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=StUbj1qio6wwGfPdysYuT6d/VUp+EjrE2Z7gFeivv7Y=;
        b=Oppz2IBf7r+l6+l2Om/FbtxTf+Jp/n7UW9Oye6x1pUi6uX6juJ52NVps2lSDzBgHSs
         0L3HhoGGeK8QPnXeAVimgEYsDBIDHJ7VuPF3taTKc5kSS1B6A4E7eJAGwEqPNFx076RA
         2IRMEavyhCUkBECEPBqJUOMhJVZHbQupT8pBLBvpWYHNcxr6nwrSGChchdWowe5pZY7w
         92/eXzTFM8bM72/zWqk7GLYjnvWBXFOqKZKZiIc9zWDoiChUEEgA+cvJlJc62cqi2Tv1
         5O2wHr+y9Z/4bodRzxt7DTX4pwLhG9/vfZ3r7S3QwLa7uO0kX5REGgUbk5pNsiGAPjvE
         Bn8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dpUkQh0w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020ac84904000000b003ba124164bbsi12477724qtq.315.2023.02.15.08.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 08:17:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dpUkQh0w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSKSv-0006sS-5k; Wed, 15 Feb 2023 11:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSKSu-0006rg-7N
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 11:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSKSs-0008EF-10
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 11:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676477820;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StUbj1qio6wwGfPdysYuT6d/VUp+EjrE2Z7gFeivv7Y=;
 b=dpUkQh0wz0QfiQiiYX3B/+PYU+6QW7pjAPjUBQNrfPjvQmpSObj2huLDNAEXtVRoaKAu+o
 3gNiaQY+nfLKSNGP/FDFtOZTcgMxo6FB+WdsHlyYGRIQ0Rwv0sM0k+/sFVp1ycXno36DIm
 /Z6/JaNZuYnw+izBk7MsYrYTcads9MU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-VPmvO4TmPQqBpGe0hR6b1w-1; Wed, 15 Feb 2023 11:16:59 -0500
X-MC-Unique: VPmvO4TmPQqBpGe0hR6b1w-1
Received: by mail-qt1-f199.google.com with SMTP id
 v3-20020a05622a188300b003ba183e8272so11364386qtc.0
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 08:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StUbj1qio6wwGfPdysYuT6d/VUp+EjrE2Z7gFeivv7Y=;
 b=Aq5AC3UcSHhdyzWZUyMgedtJ6CMcXgKRj93wNK+ouzcUsFPbIXa73YxdtEXIm5mDzt
 oPv69Dw3mdFHK+zy1N5dsQQNpYBrtrk1z1krNu9/6elKkMdQNApwwyoSKhSXbX/JQ77x
 cBPYmGgWgq6pl3FjP0EVS1QXrjdKMZDba5w2oe6sslIfYurxzHIj0wS9B3anzF7K92lI
 Ppqk+QPE9Tt5BthVp0ig5HXHscM4h7Axrw2U7NoXh15d8DA86aKMiFjUL37dhK8c3Czm
 2c+LaGYFabpwBqUywIQPEae4Ql14vWIrtJEvtwnFzoBml/I8PBgeun69lUZ5xFBmOX2H
 XRug==
X-Gm-Message-State: AO0yUKV1FOL/Pwz6VZi8skOgiAiisG81z+LWrOuyVAzhIdqhCmFlFlE1
 ejNC6ZeRZ24m8prywWKYIRsC/oxrfZhpNaz1QALJHet0s1HApcKBskrzbFtmQYlk+vnpRpfSjri
 fpV81wLI8uZ/s
X-Received: by 2002:ac8:5bd6:0:b0:3b8:683c:40f with SMTP id
 b22-20020ac85bd6000000b003b8683c040fmr4072802qtb.30.1676477818813; 
 Wed, 15 Feb 2023 08:16:58 -0800 (PST)
X-Received: by 2002:ac8:5bd6:0:b0:3b8:683c:40f with SMTP id
 b22-20020ac85bd6000000b003b8683c040fmr4072767qtb.30.1676477818555; 
 Wed, 15 Feb 2023 08:16:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o24-20020ac84298000000b003b880ef08acsm13498857qtl.35.2023.02.15.08.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:16:57 -0800 (PST)
Message-ID: <f231beb8-df21-29bd-93e5-c8b826c2a221@redhat.com>
Date: Wed, 15 Feb 2023 17:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 01/16] hw/arm/smmuv3: Add missing fields for IDR0
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-2-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-2-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0Aam9teygvnA

Hi Mostafa,

On 2/5/23 10:43, Mostafa Saleh wrote:
> In preparation for adding stage-2 support.
> Add IDR0 fields related to stage-2.
>
> VMID16: 16-bit VMID supported.
> S2P: Stage-2 translation supported.
>
> They are described in 6.3.1 SMMU_IDR0.
>
> No functional change intended.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-internal.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index bce161870f..170e88c24a 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -34,10 +34,12 @@ typedef enum SMMUTranslationStatus {
>  /* MMIO Registers */
>  
>  REG32(IDR0,                0x0)
> +    FIELD(IDR0, S2P,         0 , 1)
>      FIELD(IDR0, S1P,         1 , 1)
>      FIELD(IDR0, TTF,         2 , 2)
>      FIELD(IDR0, COHACC,      4 , 1)
>      FIELD(IDR0, ASID16,      12, 1)
> +    FIELD(IDR0, VMID16,      18, 1)
>      FIELD(IDR0, TTENDIAN,    21, 2)
>      FIELD(IDR0, STALL_MODEL, 24, 2)
>      FIELD(IDR0, TERM_MODEL,  26, 1)

