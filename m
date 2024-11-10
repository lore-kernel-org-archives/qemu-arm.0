Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5915357njc;
        Sat, 9 Nov 2024 23:10:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVUocQjykbvhRus2vXsxSUe5KeO6mAl3cpBQ/tI7rRJpkoidg30aw9EwBOMRDzRB+CGhvtlvmPrUzrIJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFGhdvX+ULWn49gZtI5onOY6RYOIG3MwaMZ6vewJz4sd6484NQPOMCw7udSie77bSCni/mz
X-Received: by 2002:a05:620a:3189:b0:7ac:aad3:9135 with SMTP id af79cd13be357-7b3328f2ccfmr1220516085a.15.1731222616403;
        Sat, 09 Nov 2024 23:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731222616; cv=none;
        d=google.com; s=arc-20240605;
        b=TGd6BoHu50+K+RcitbdKN30UEvlY1UX3bJO6+lJSb0PGCjfThGeJnYgCqwzQWV/Izl
         al81PltocDGMX5ljuzqSr36rRbGg5WgytWY5rmdPCrckkK18vdioByQR4UKE7TOphLTZ
         UbTI8AhdWeOYN5LEhzd7N0Edi+UfVXJjh4JCxc79eH4RPNss4DwsHb+BF0vq7Hw0EM7E
         y7a6A1HmtM7nJXO6rrMbJW5jG0kunXSPm2CRS4xTL1FdmqQpbGaQo7VSKWjmykJnWwrt
         ZmBbUPatlrsDGtrtZiIDI5i1GJb2g7/xO77ctEFUBJx++WCtHvkinaJ510DeRh2JRyMY
         eToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SzR5FQxch6iZdJ2G6xZNMSnzArOzVGdnFhFcZDcqkxk=;
        fh=lt2DcUaAuKW8LT8oh9Wh9Yv+j7apN1PBNUQnGaQw2jk=;
        b=l1dNoYIl3nt1UoMI0ycXhGqGrF0bmJIi/xi8H5YZfh7irxA2MVbiq0gIo5JfH+jM2i
         S5oDnUyPvbyCpK4S/cft4ZWtKt1EaYetwLYVX+cBljyK2TUxKVYKuQnv/lQf3UHJTy+j
         +0i3mVwzOcaJsDb4CFpbpV/6rsc5BxQDWeD8iedN0kc1LdBEhCXJdzIsaPoeyFcfQbST
         isFQp3+boWKabcZIjk9bQdbgw0c9hIwDMrtDhtBNKK5IACRLhYYLw/maVLuh0Gm5AGrD
         PuCaYW/Swv3CKUwd6o7YxVA+6FdTRxoyHawnnFhMcnzaAVfTrVVihM2wzJ255S/W4m+o
         BTvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=uc3yrynN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad1eec4si844069885a.585.2024.11.09.23.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Nov 2024 23:10:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=uc3yrynN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tA25N-0007iZ-Dp; Sun, 10 Nov 2024 02:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tA25K-0007gz-Fe
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 02:10:10 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tA25H-0005z8-5B
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 02:10:10 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20c8c50fdd9so31201835ad.0
 for <qemu-arm@nongnu.org>; Sat, 09 Nov 2024 23:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1731222606; x=1731827406;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SzR5FQxch6iZdJ2G6xZNMSnzArOzVGdnFhFcZDcqkxk=;
 b=uc3yrynNhRyIj6/V9wg99CiQGAAQzEEdhlIQJVN/iuoGjHLelnGDfc6pvjCkzfkojT
 8NXAB6/w0Ot9ips/3CwKudGG9mwJmTE7jfmLt2y1LvPw+Tve7Ds8Pokma3PgL51Z8e/a
 ZxWw9Qhk8gg97NsU7atXldp8mFDtyy9mTC5keuoDi2o9FR6s5FOYFvPhzObktg4gtNjp
 WLDduz6QsajOZfruRK+gPnPc1MNsjVB8zwkS9bNnNoaZGUocAoYq8O5BHZG2KZuJ8ZKD
 JdmmaEJX0E7cKEfc6VhXcpXVDGsxhERE8Mp7s0RcgOktUvWCSBdLUqROtx8fWjRJGKe2
 d3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731222606; x=1731827406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SzR5FQxch6iZdJ2G6xZNMSnzArOzVGdnFhFcZDcqkxk=;
 b=QpidFR5A8Cp9EFiKYZnuC/qKC2JPjuKpD4coAesw7t/jdw/H6UCtjsQKdhXFqsXu96
 QWS/b1U8yxrICACVy2CBR3Pqi9lft2p+OHM6TXnLJ74LmeHgSDkU9Du8bDeNp2yXzv/X
 z0kqYqt3Avq77DAgck1WXqstnzU6HN1w7glLPSAjnZp6+CXMCH9fpfLLP1GLqmH8L4G7
 zVtyqvJkVqZMg7Qj2ysvsJ/sRXIua2mjGbim3xprkFU9njY/W/IoYMXcyaxtYQViiLYU
 harNW3w8HFgNFTj5xSByby/OA3qRRZsZO6R1GiBf12a0wvSXVZWlufyzQOku97141ob6
 drrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDh2lpgYnsOEMg2lD9FUeaCC9yOukX1BVWcF9yZbdHAeAfOyKdaol8TJAVXr5J191aN4teQATkKA==@nongnu.org
X-Gm-Message-State: AOJu0YyUnksRKwA0+DhzIcCCguJOCm9IK6Be+hgugeLVni7YwLIuMiU9
 gKnvBZrebI7zt23Fs6SoCzEqDnzn+3JD8aYegmZSm6zQaGIXGOOr7rPcaFrvEFU=
X-Received: by 2002:a17:903:230a:b0:20c:6bff:fcb1 with SMTP id
 d9443c01a7336-2118369d530mr131393595ad.1.1731222605630; 
 Sat, 09 Nov 2024 23:10:05 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177dc970asm55432285ad.52.2024.11.09.23.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Nov 2024 23:10:05 -0800 (PST)
Message-ID: <07ec41b8-922c-4c6a-b550-63fc4481d019@daynix.com>
Date: Sun, 10 Nov 2024 16:09:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/15] ui & main loop: Redesign of system-specific main
 thread event handling
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org
References: <20241108144709.95498-1-phil@philjordan.eu>
 <20241108144709.95498-2-phil@philjordan.eu>
 <9c2e0b96-2125-4041-9f66-116d54accb04@daynix.com>
 <CAAibmn3NbtOEwWLQFOo_UmAGTehOj+dDP04A=-JGMZVK9AYMDw@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAibmn3NbtOEwWLQFOo_UmAGTehOj+dDP04A=-JGMZVK9AYMDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: HF+HVXX0U++v

On 2024/11/10 16:08, Phil Dennis-Jordan wrote:
> 
> 
> On Sun 10. Nov 2024 at 08:01, Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2024/11/08 23:46, Phil Dennis-Jordan wrote:
>      > macOS's Cocoa event handling must be done on the initial (main)
>     thread
>      > of the process. Furthermore, if library or application code uses
>      > libdispatch, the main dispatch queue must be handling events on
>     the main
>      > thread as well.
>      >
>      > So far, this has affected Qemu in both the Cocoa and SDL UIs,
>     although
>      > in different ways: the Cocoa UI replaces the default qemu_main
>     function
>      > with one that spins Qemu's internal main event loop off onto a
>      > background thread. SDL (which uses Cocoa internally) on the other
>     hand
>      > uses a polling approach within Qemu's main event loop. Events are
>      > polled during the SDL UI's dpy_refresh callback, which happens to run
>      > on the main thread by default.
> 
>     GTK should also do the same as SDL and requires treatment; I forgot to
>     note that in previous reviews.
> 
> 
> Although it‘s possible to build Qemu with GTK support enabled on macOS, 
> that UI doesn’t actually work on macOS at all, and apparently hasn’t 
> been supported since 2018, see:
> https://stackoverflow.com/a/51474795 <https://stackoverflow.com/a/51474795>
> 
> I don’t think there’s any point making adjustments to the GTK code by 
> guessing what might be needed if someone did fix that to work with macOS 
> at some point.

But there is a GitLab issue saying it "sometimes" crashes, implying it 
works otherwise:
https://gitlab.com/qemu-project/qemu/-/issues/2539
