Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11682684wrv;
        Fri, 26 Jul 2019 02:40:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUg11Y/TBXMWAYEo9PIuf7Jfmf40sB8jxT2J6B8hYR2HUZjnc3bGX2PqE05H8szo5Gqc8I
X-Received: by 2002:ac8:37b8:: with SMTP id d53mr64641685qtc.227.1564134008097;
        Fri, 26 Jul 2019 02:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564134008; cv=none;
        d=google.com; s=arc-20160816;
        b=nhqdvzE8wFVfx1J4heVXKJrKM7ubldQUXxD2qRiAD9OCCg/4TvzWrymASTHlyYqTwj
         LYJoWkOYSsUJW8jBtcQiDHsH5sZl5jzhe3F8uiCBvLWG18NKyd2DbBxHwgiY7dgyu2p+
         RYZO3XknOBRtOH6h5zL0YiomT4yMrzgBiY4pnYX+1B7899lOuNXmEqgVSAqKkhgED4GC
         /JSavR+t1185OWF/JI6dIvWw9KNx0wConIW7u0ZavIlR2pg0hky12u92ZcSq2duMnRy4
         GiU+ArUF3/2G3TtZDs+/geDXipr6X9lYWhKd41COeL7sJdbgVUlZlLhEnpCydQ7MlHYV
         PrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=fSfrGrRhjJEug1iM2o0JkpzkU95zBrleqMeDoDm1YlU=;
        b=niQ4a45KGH2hhmeRXmT9RV4I0xvAm4YnoK57zYiaXU1JmVcI7w6cRbObX04ko7WcnE
         sPKknRoFwst6SXh9csxYCvfxluL07eansfca059r4nSmBOUfHhAkZz6NfL14dlIklXeN
         xAP4lloMCF9+8utDlnYNTXzRIKgfy8usbVIaXNyrs8XH00RtyX4yGsc5nyueJU1cMFcB
         pcXcRHVYb2GZClkpdlGrDCAI+PycWtuTzXI1xu5RlMcD53t6/hHEbMiaXxh7dFVnmlwA
         2UqPV2t/pP/Qrm5rDM9jfo4lUsN1qK12q1BsODCB0YCLGN0mVmJQhZj/0eCtyrJE9MBZ
         mOjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b45si34005331qvd.118.2019.07.26.02.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:40:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwhn-0007ka-Na
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57593)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hqwhh-0007jx-TJ
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:39:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hqwhe-00047H-OB
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:39:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39245)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hqwhe-0003w1-HU
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:39:54 -0400
Received: by mail-wm1-f66.google.com with SMTP id u25so36755005wmc.4
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fSfrGrRhjJEug1iM2o0JkpzkU95zBrleqMeDoDm1YlU=;
 b=bWirG1tikHN8gb3VWHfp82dfGI3BUE1Er7jFfKi9qfQJB3Utso2rDgUM9abxoYNq1c
 Yk7KmVMpgHpxejAKTtsdKZuUuXviYtqF8RT8TtsEdBkwVaDkrkL24kqbChcVRuLUrPeX
 aHdmMSwWGJYdtQgpvTwXE/eHfVUljxP6C0JMdWz+unA+U5HyzykrNpdxid2OqziXxzGc
 Zhv8G0QU+Y5WkoRDUz0e461gVWXKrzL2VvNO6PKnjM4jSCr4wPzIYctOSHLtk0kSjehu
 8lVj6vAjZcT/CP6UjMr70q+KrT0ehEIE+8djQvSn9sXcgsJd0zgaGqgvF8FU5eGYEWPN
 j2Ng==
X-Gm-Message-State: APjAAAVxKztJV8nn4P3cJg96G6iXokddReQRvZI+yYsQC9pr35NDAo98
 Y1rQMbuYnzzgb9o6CBsJfcEdyw==
X-Received: by 2002:a1c:228b:: with SMTP id
 i133mr84279148wmi.140.1564133991298; 
 Fri, 26 Jul 2019 02:39:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:cc23:f353:392:d2ee?
 ([2001:b07:6468:f312:cc23:f353:392:d2ee])
 by smtp.gmail.com with ESMTPSA id b5sm43505459wru.69.2019.07.26.02.39.49
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 02:39:50 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123667210.66446@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2159ad69-4c4c-24dc-6759-039e39f952d3@redhat.com>
Date: Fri, 26 Jul 2019 11:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123667210.66446@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 11/15] memory: Single byte
 swap along the I/O path
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CadOTcZaOnSV

On 26/07/19 08:47, tony.nguyen@bt.com wrote:
> +static bool memory_region_endianness_inverted(MemoryRegion *mr)
>  {
>  #ifdef TARGET_WORDS_BIGENDIAN
>      return mr->ops->endianness == DEVICE_LITTLE_ENDIAN;
> @@ -361,23 +361,27 @@ static bool
> memory_region_wrong_endianness(MemoryRegion *mr)
>  #endif
>  }
>  
> -static void adjust_endianness(MemoryRegion *mr, uint64_t *data,
> unsigned size)
> +static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
>  {
> -    if (memory_region_wrong_endianness(mr)) {
> -        switch (size) {
> -        case 1:
> +    if (memory_region_endianness_inverted(mr)) {
> +        op ^= MO_BSWAP;
> +    }

Here it should not matter: the caller of memory_region_dispatch_read
should includes one of MO_TE/MO_LE/MO_BE in the op (or nothing for host
endianness).  Then memory_region_endianness_inverted can be:

  if (mr->ops->endianness == DEVICE_NATIVE_ENDIAN)
    return (op & MO_BSWAP) != MO_TE;
  else if (mr->ops->endianness == DEVICE_BIG_ENDIAN)
    return (op & MO_BSWAP) != MO_BE;
  else if (mr->ops->endianness == DEVICE_LITTLE_ENDIAN)
    return (op & MO_BSWAP) != MO_LE;

and adjust_endianness does

  if (memory_region_endianness_inverted(mr, op)) {
    switch (op & MO_SIZE) {
      ...
    }
  }

I think the changes should be split in two parts.  Before this patch,
you modify all callers of memory_region_dispatch_* so that they already
pass the right endianness op; however, you leave the existing swap in
place.  So for example in load_helper you'd have in a previous patch

+        /* FIXME: io_readx ignores MO_BSWAP.  */
+        op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);
         res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type,
SIZE_MEMOP(size));
+                       mmu_idx, addr, retaddr, access_type, op);
         return handle_bswap(res, size, big_endian);

Then, in this patch, you remove the handle_bswap call as well as the
FIXME comment.

Paolo
