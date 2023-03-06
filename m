Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4450224ejc;
        Mon, 6 Mar 2023 01:54:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9ow9arOXJG9W6eUfuHMoSoBa2aCUQmM8uYyM8iqE1jCBqGAkiwJ0f/vept+Qg79pEWykTK
X-Received: by 2002:a05:622a:11c8:b0:3bf:d8b6:4cc7 with SMTP id n8-20020a05622a11c800b003bfd8b64cc7mr16255534qtk.58.1678096460334;
        Mon, 06 Mar 2023 01:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678096460; cv=none;
        d=google.com; s=arc-20160816;
        b=HbYK24lOe1TALgYK8/auIDH/ApzziRiJF7f+kN/nX79DpDNmRHQn8dFmoKmlXGrFFi
         qV3WFlzrkLDPbssdkAxMZF2UpYx8aepS6yv5dhs9yr7Ux/wQHTC9k1Ixff09vLd+mxkN
         BwZMMu1G36YMQH4T1t+QD+6rk9ua4GAxatG5e4PX2CrKVYTJaN4A3YWlGjcHR+GwJbnE
         SjiihF6zpqRK5smiZ3O1mf153pkATtN6dos5Rc4BnJV+dO/Lxx7P3XeiVymDS/6kBw7O
         ETiZwX1UlPGjRR5zVW4PKgCW0RdkUC88QCvlAosBd53MHYU7tZG8ibxC+G01aCsv8YvJ
         eVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/IZ1ky/xkWglsrFT/6nq1KATgbmkO5fk4nyAibCjdSg=;
        b=LCebod79/TpK5QnJjs1Gn/we+S8H86SPiJOv94a4LAT8r6pNqrFo9IxPkYGqKJJoIN
         iCS9gAQk8ON7+aTkwSFvfsXGU4XAkgxHbBZMXzL49/K9mZ7v5ajHSFzZjOSTWQHairX/
         q4a55i68jfWpI8sT64HyLRl5OMPNW/BLH39ciUltRpC8yodkENkFx4zXob0+zCZ8ABPv
         af/YQaLZdnwNQMoAkEafQcEvQqoK2LfZQHEimULNEfGqrh3S98X7KBQFu9q6+orN+CFq
         Hbt2ofV4hF9KneswAV/rVbuLjWpRTociZ3+C+Kq7cB5xedjj6rSxnP5XTDEgmuKJqk/0
         euKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qt2KrhSt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s12-20020a05622a018c00b003b9f75c03e9si7037041qtw.440.2023.03.06.01.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:54:20 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qt2KrhSt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678096459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/IZ1ky/xkWglsrFT/6nq1KATgbmkO5fk4nyAibCjdSg=;
	b=Qt2KrhStts6zb2eGFzz1TMUZjde+c5t1FQpeW7RydPFZjsDsuOJPlg3ZRwhGml7IKLmdb6
	c/0v3Ne25Fl/buX644Ealqr85qeBfQW2icYtFwfrQPU3y4zCSo7oy/0ONyLNhnHdkbsfs2
	9bD28CjHd1SiZ2zOkXz/SYn5bxo7j+s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-Gh1Up9zWPOSy9tCRzCXq0w-1; Mon, 06 Mar 2023 04:54:18 -0500
X-MC-Unique: Gh1Up9zWPOSy9tCRzCXq0w-1
Received: by mail-wm1-f72.google.com with SMTP id bi27-20020a05600c3d9b00b003e9d0925341so3348917wmb.8
        for <alex.bennee@linaro.org>; Mon, 06 Mar 2023 01:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IZ1ky/xkWglsrFT/6nq1KATgbmkO5fk4nyAibCjdSg=;
        b=mHy7FZrVahUI128gxLcdJHwGvzkfj+INfGHIdwVcDG3HR0eBHjjZQ0T4zx/8Vp1s45
         NXlswc0GJpFBYQ2UkN+HuVlvpkwJbglYXABBgzHQO0/cL1F6/su9QAEvNEj5+GGDR3k+
         Z92wLGRtRKkU5UuRG4FsTDulRsIzObTO7HAkHBODmt/X792LIsr9FDC6d8Ro8cmU1RI6
         mMXLVBYB/wBxhQzL9Epo5SIy0PGqHogs1tvama5lxDyeiznaE83jfcq0LEBxLhZ5/66L
         b5U7ezCUIDvYgDKXPl4UaxA8EZ5+SW+B9PgU/X/pIOEyp5VY7Lm1t3qK+4jK5DUERzA5
         kTug==
X-Gm-Message-State: AO0yUKUaQWaiDCBONlX89pUpBK3nWoC/iuXUTopNSlK6CqTDL/4wZf+k
	hTpdxya3zXAXuJ/jbUIasif5yw/FLsGTUFZQto6cQ3bVt2lT+wgAueQj8Z2HjsI4GHJZfjPUSAq
	HjffnSMhtfmetZmTL
X-Received: by 2002:a05:600c:4e41:b0:3ea:e7e7:a2f9 with SMTP id e1-20020a05600c4e4100b003eae7e7a2f9mr8714208wmq.13.1678096457798;
        Mon, 06 Mar 2023 01:54:17 -0800 (PST)
X-Received: by 2002:a05:600c:4e41:b0:3ea:e7e7:a2f9 with SMTP id e1-20020a05600c4e4100b003eae7e7a2f9mr8714198wmq.13.1678096457477;
        Mon, 06 Mar 2023 01:54:17 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de. [109.43.177.59])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b003e1fee8baacsm13959147wmo.25.2023.03.06.01.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 01:54:17 -0800 (PST)
Message-ID: <e5a86d76-03af-6da9-a8ee-da4a494e0e23@redhat.com>
Date: Mon, 6 Mar 2023 10:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAWx5eBskd1cItDx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: o+ja1pziQ8hv

On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>> Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
>> binary is a proper superset of the qemu-system-i386 binary. With the
>> 32-bit host support being deprecated, it is now also possible to
>> deprecate the qemu-system-i386 binary.
>>
>> With regards to 32-bit KVM support in the x86 Linux kernel,
>> the developers confirmed that they do not need a recent
>> qemu-system-i386 binary here:
>>
>>   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 1ca9dc33d6..c4fcc6b33c 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
>>   ``--enable-gcov`` build option remains for analysis test case
>>   coverage.
>>   
>> +``qemu-system-i386`` binary (since 8.0)
>> +'''''''''''''''''''''''''''''''''''''''
>> +
>> +The ``qemu-system-i386`` binary was mainly useful for running with KVM
>> +on 32-bit x86 hosts, but most Linux distributions already removed their
>> +support for 32-bit x86 kernels, so hardly anybody still needs this. The
>> +``qemu-system-x86_64`` binary is a proper superset and can be used to
>> +run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>> +on x86_64 hosts. Thus users are recommended to reconfigure their systems
>> +to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
>> +environment should be enforced, you can switch off the "long mode" CPU
>> +flag, e.g. with ``-cpu max,lm=off``.
> 
> I had the idea to check this today and this is not quite sufficient,
> because we have code that changes the family/model/stepping for
> 'max' which is target dependent:
> 
> #ifdef TARGET_X86_64
>      object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
>      object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
>      object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
> #else
>      object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
>      object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
>      object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
> #endif
> 
> The former is a 64-bit AMD model and the latter is a 32-bit model.
> 
> Seems LLVM was sensitive to this distinction to some extent:
> 
>     https://gitlab.com/qemu-project/qemu/-/issues/191
> 
> A further difference is that qemy-system-i686 does not appear to enable
> the 'syscall' flag, but I've not figured out where that difference is
> coming from in the code.

Ugh, ok. I gave it a quick try with a patch like this:

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4344,15 +4344,15 @@ static void max_x86_cpu_initfn(Object *obj)
       */
      object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
                              &error_abort);
-#ifdef TARGET_X86_64
-    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
-    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
-    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
-#else
-    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
-    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
-    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
-#endif
+    if (object_property_get_bool(obj, "lm", &error_abort)) {
+        object_property_set_int(obj, "family", 15, &error_abort);
+        object_property_set_int(obj, "model", 107, &error_abort);
+        object_property_set_int(obj, "stepping", 1, &error_abort);
+    } else {
+        object_property_set_int(obj, "family", 6, &error_abort);
+        object_property_set_int(obj, "model", 6, &error_abort);
+        object_property_set_int(obj, "stepping", 3, &error_abort);
+    }
      object_property_set_str(OBJECT(cpu), "model-id",
                              "QEMU TCG CPU version " QEMU_HW_VERSION,
                              &error_abort);

... but it seems like the "lm" property is not initialized
there yet, so this does not work... :-/

Giving that we have soft-freeze tomorrow, let's ignore this patch
for now and revisit this topic during the 8.1 cycle. But I'll
queue the other 4 patches to get some pressure out of our CI
during the freeze time.

  Thomas
