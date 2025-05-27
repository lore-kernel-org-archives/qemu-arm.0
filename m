Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4804281njc;
        Tue, 27 May 2025 06:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJH2Q09tb+uWdzRajT8SVSj+qv+iSCGQVUBAAgWyTXDC1PQxtFGy5xXL9zb5b92RomZ14AM6CIWoI8rQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGcBB3oou0KKy6Ut+ozMTxDXtE5ZiB/8TidFHKO/MNNfa2xur7/SrAfxeayOoPOc+7AENIA
X-Received: by 2002:a05:6102:3f0d:b0:4e2:c6e4:ab1e with SMTP id ada2fe7eead31-4e42408cc55mr9162693137.7.1748351554275;
        Tue, 27 May 2025 06:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748351554; cv=none;
        d=google.com; s=arc-20240605;
        b=ayHYW/e2iSch/TIkY4Y7v2kjtFyt4XCrjPgJJqoyMRI4514GFcZi6jNutYnh+vABwq
         p4qDzuFpBMHLx2Xdmde699bLa+hN4ynK6siOaquTPl9Jvu/vCtbgC2jHbdii7Urt8X6x
         QZPe0oe4UTU4ANxKS4nBdwXtedDCYRA6teJnHRgdNJMT1gJAVqRiD+NlX8/E4WqRHiUc
         5RsWTEwu94f9VhKLSDv5f6GS6zY6g4U7HYVbku1J8rc79uqk8vRex8Yo2G9/dSEM64W7
         rqWbj13QTrQWlxOwpTOMKzCwnPr0UkCIWK7o5DHEkKBn/9WulTHMdtK7lBFextAVKs24
         OD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NHKxc5nfasUEG2+1eqnzlUAnWhZUtYise2kTgHplEI0=;
        fh=zOn7j9CaEO3+z6PUyEsUeZF+e9Em8fx1YLpdA2eGV5A=;
        b=IH6ZRvTLrZJNBqR/2aMh2uRelbVKAsSDsxZWcTKfWI2cZw8vEneSdo/7S1d1lM1Wpe
         mSmkrHKHFL2HIX2C5Qd/IYxxen7NCVfuFkhLp2sFHzLrJk7ap3OMF1qKHKhZ4y4S2mZq
         U9K9aNcDHwihg9387Eu5f7p8lmNOsDTwjSJPZ5I9E1wLKA0e/hoXInPduqRkBYkdslso
         MRT6RxsDoqOeUHVm5YN9zsHNtcKTviBoDC3z1soMhl7hBquiYpZu/euBUnvRRiwasbkg
         H0UJWhR3S6hWoTizW8lT2tsJso9EsoHDHyzumnimBRPK08O2StnHVMgESRU2jnlSZmBe
         kntw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uq3Z0OSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4dfa68745f3si9222853137.483.2025.05.27.06.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 06:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uq3Z0OSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJu6E-0001Gb-D5; Tue, 27 May 2025 09:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJu6D-0001Fl-0s
 for qemu-arm@nongnu.org; Tue, 27 May 2025 09:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJu67-0006MB-Pr
 for qemu-arm@nongnu.org; Tue, 27 May 2025 09:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748351521;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHKxc5nfasUEG2+1eqnzlUAnWhZUtYise2kTgHplEI0=;
 b=Uq3Z0OSnXLt1TiT6OJF7xi0oEG4wgBYNI1rsvqn08TL5nPCrQKXqhLuJORbm/hYhvpBLtM
 C64Lu5j0RrPcJh+3eZBwDYySkvfqrYTh9M8ZY02psFq65Bh+rMwf2V6CT9pwXTdQ3q0JSA
 w9WmqKKJdDbeRewWj0GygeBfzLlINsM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-d_sCchKsPdCJ5haMSOIIaw-1; Tue, 27 May 2025 09:12:00 -0400
X-MC-Unique: d_sCchKsPdCJ5haMSOIIaw-1
X-Mimecast-MFC-AGG-ID: d_sCchKsPdCJ5haMSOIIaw_1748351519
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4e1c6c68bso565922f8f.0
 for <qemu-arm@nongnu.org>; Tue, 27 May 2025 06:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748351516; x=1748956316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NHKxc5nfasUEG2+1eqnzlUAnWhZUtYise2kTgHplEI0=;
 b=WkPCGaG7z0LImNFzwxeT3f1jMNu23PjjIlo9D53IKuxJDNE3ydYmUKGK/o0waQQOZi
 Gb6fuXd5sjlQmk6FNK0lkUtitUDa1RybkTB8h6XBi69RQgD0m8fDE/kEoU2q0eD6z5pa
 R7NcFOUcZsqmRf95bhHfjfjmSYSiTfU/4z82g/b1KGKZX6aNj2CG1BZaXIpl7ls8nNOn
 E5CEvgZREz3YO5MGF8D9+gji/1t69v4adz+gIlCI4CmbYZNYDlsonGYSePTUEhKoN8gL
 6d9R6SX9f9EG1Zjt+jFFOZlRa9moecFt/jlpD+/urecJie2qftBMNhUp/HRKO/LKNbmZ
 W4sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVas+0OKn3a57rzvVyl2ey7zvsREmFp2N08eSifAz/7aZcLdQnF0xAG+PJ4PkjawUlaMe5sPu2fEw==@nongnu.org
X-Gm-Message-State: AOJu0YyRDAC6WhFOMTbjcoWWoPqLZcvSYIDXeiYz4sfwHYuyhafmQ7OZ
 FV0L1TNgy8gTxWjc4NxnNBDA90UV3R/xa20+yB3uBPXeNkQjR+M5QgMnR3BEZKIDyPNlvI9+osH
 5leGI7shJJsRXTkfXeXmKItEZsl2T76pfsV3+jSy4vOFV8L9m0WnMYUy3jKB8OA==
X-Gm-Gg: ASbGnctLApjeZOucLWm4zfmz6GCF74JJVq9Z3mXwixNuxkFfbiyTgmqgVRZnzwih98k
 G4LAkvri9H0NSKk3k3s4Fiw0okpm16G3GXeb2UQuTsex7Q6DYbCB6HRtSN4up7wfkfJc4VThziU
 x00t0xq6dhHRG2h0E9OkzvWAwv36vqOe2LFNKpku3+/KwgZEiX7DfnKB0LVqZCDjlMR9XzxFsee
 /lJ5b7E+9iZJqSh2fY/L0y+0lvrF6QIRCZKmmQX9a6nxN7QSSsX1jR8afLxA3JVh8B7QuRUmAml
 zUZGcB59wqRCGDMQjoSOUvKRIrCtaE7FNSzFF+dcTR0z4M09T7eh8o5/KPw=
X-Received: by 2002:a05:6000:26d0:b0:3a4:e502:81b8 with SMTP id
 ffacd0b85a97d-3a4e5028508mr835896f8f.43.1748351515494; 
 Tue, 27 May 2025 06:11:55 -0700 (PDT)
X-Received: by 2002:a17:907:9706:b0:ad2:3d34:e2a4 with SMTP id
 a640c23a62f3a-ad85b1ce8d4mr1153657466b.30.1748351504011; 
 Tue, 27 May 2025 06:11:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1fe4fa6sm263863135e9.16.2025.05.27.06.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 06:11:43 -0700 (PDT)
Message-ID: <ee464d7c-9b77-4aa7-9afa-627e497c7581@redhat.com>
Date: Tue, 27 May 2025 15:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] ARM Nested Virt Support
To: Miguel Luis <miguel.luis@oracle.com>, Marc Zyngier <maz@kernel.org>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "gkulkarni@amperecomputing.com" <gkulkarni@amperecomputing.com>,
 "gankulkarni@os.amperecomputing.com" <gankulkarni@os.amperecomputing.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <C10D9293-32F7-4834-9CEE-6AFD4BDBC30E@oracle.com>
 <86ldqidzyl.wl-maz@kernel.org>
 <822E77EF-9802-4F16-B8D4-A48F3A624151@oracle.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <822E77EF-9802-4F16-B8D4-A48F3A624151@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LACHDaYXqCnmIp52t82f5rNffeKNf7aAgzPmYE_wOHc_1748351519
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5i0pZTrYuaHI

Hi Miguel, Marc,

On 5/27/25 2:54 PM, Miguel Luis wrote:
>
>> On 27 May 2025, at 12:01, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On Tue, 27 May 2025 12:33:23 +0100,
>> Miguel Luis <miguel.luis@oracle.com> wrote:
>>> Hi Eric,
>>>
>>>> On 27 May 2025, at 06:24, Eric Auger <eric.auger@redhat.com> wrote:
>>>>
>>>> Now that ARM nested virt has landed in kvm/next, let's turn the series
>>>> into a PATCH series. The linux header update was made against kvm/next.
>>>>
>>>> For gaining virt functionality in KVM accelerated L1, The host needs to
>>>> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
>>>> with: -machine virt,virtualization=on.
>>> For the current kvmarm/next the guest also needs
>>> “kvm-arm.mode=nested” I believe.
>> No, unless you want the guest itself to be NV-capable.
Effectively you don't need "kvm-arm.mode=nested" except if you want want
multiple level of nesting.
>>
> Correct, I got carried away with some mode combinations. Maybe we should depict
> here more broadly how NV might be used with different mode combinations. I'll
> think about this further ahead.
>
> As far this series go I couldn't found any issue booting a L1 guest with
> virtualization=on and a L2 guest with virtualization=off.

on my end I tested with various untouched L2 guests (debian, fed, rhel)
in 4kB/4kB/4KB page size mode (host, L1, L2). Those configs were successful.

with 64kB/64kB/64kB configs I am less lucky atm. One one machine I
cannot boot L1 with virtualization=on. On the other I can boot L1 but
cannot boot L2.

Trying my best to debug a little bit further with my setup. Anyway if
somebody else can try 64kB configs, it would help to confirm whether
there are pending issues. I don't think they are related to this qemu
integration series though.

Thanks

Eric
>
> Miguel
>
>> M.
>>
>> -- 
>> Without deviation from the norm, progress is not possible.
>

