Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp757396ejo;
        Fri, 5 Jan 2024 06:47:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLMM/waUNMFwSfiURaiuTpx7phvn1c5RKf+DjFnvsHXJk11tqji5JBGzTXi7EKWQaiXJaU
X-Received: by 2002:a05:6214:f23:b0:67f:99ae:75b3 with SMTP id iw3-20020a0562140f2300b0067f99ae75b3mr2313831qvb.113.1704466065603;
        Fri, 05 Jan 2024 06:47:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704466065; cv=none;
        d=google.com; s=arc-20160816;
        b=i5Pc+PV794dvTuSMNNfpAGyXAGDNjMPU4jh95MY1jeOvZNXY84rlhLSAxwbrZ3LeA9
         tUMD5vJYImCYt+8/U6nOuTxtjeRrVsE227i8Q2UfaWw09fch7YT5T0oU6q/XGrB6TXk/
         zfWVfzURLVpoH8UKu3krqtipvlrUTx4g28SuJpawqsUhpJKU27I+z0+ln9poplEMDgri
         YJJlLadUHwfpVt5OEZKGmoZIWUbUy6uBnMjbsnolmfy3Kj+3yYl+le2TvQAkkZ9uNFTz
         pH4YrvnAhoZDrForgaw8Q3xCxkNC0EAMjzCV4cwM+sZjtwcEEfzCLpwNAJ+3YPk/2CHn
         L8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4q2PRBt+A+8v/H6PAfohK1hhNC1DLucOWK2Y3cCn9GA=;
        fh=PlbwBnT9Bfmev7uGw5jtzpdvlBtxBc6o607m3FqxY9U=;
        b=PwUFdSXseAtx1GCo38fmgv9Wo57uRk6nsjDUK7h59VKcDp00Me3zhdKHkJhCkCNKuq
         G9/cz5GK9eA3M6KHjffknOkZbVzX4jcaoR9exfO9m+rCdEX7Xzwfk+zF4N4BTeibrZBy
         hzhhXOuurHcneq5wT+gdMYAKOfSOxJO8v+vyMrlxg6CgdYCRDeYn6bCKX/22tj5AgYuk
         lCn/dreqTD6Wklw+uze/KqDPBeGfNt8j2giiBKb4qFhZiCxQgJuCR8D+02+j9HOgCUUX
         BGaIe/cMsQRgsFzx3WEzmpHv3bi8bp+ml63Rjd1VHeT0RggSln0GB5erhqvuevQC++RM
         eJgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xT0C684o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19-20020a0cf213000000b0067f843ed880si1896160qvk.257.2024.01.05.06.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 06:47:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xT0C684o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLlTN-0007x2-6L; Fri, 05 Jan 2024 09:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLlTG-0007w7-VJ
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 09:46:54 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLlTE-0003cN-0q
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 09:46:50 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a28d61ba65eso195751566b.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704466006; x=1705070806; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4q2PRBt+A+8v/H6PAfohK1hhNC1DLucOWK2Y3cCn9GA=;
 b=xT0C684oi3lkkTq4HxOLe1KabzL2J/Ru6xFLtWDt6SlTrXIcXUP7/0mthLN+6lXsnU
 FlK9kKqPxxaBK0zwuEmbIXwTdqdiHzmTYNbS/OYvBddiyeiSQeHkj/j7FU1JNVztey8z
 UnXE9XEIrTU4B01zVXbD0Ip8b2D8FEa/yMRUDOzlJVEuvqqoa2F9RgKUCKojBAazQvi3
 Qs4DnJ9gyUrGWmQJ3ZwBRE1PLrCUE9eluwfRYo5eJ/cWEnGDFpoBQSmdHpx0YpFwZZA8
 hnA5Afo+dvcn/AwcqIs26BPX7NctcszuAIvdQuSLfEmz+CxMoFae9559B5yXNYQ5ipD7
 /APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704466006; x=1705070806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4q2PRBt+A+8v/H6PAfohK1hhNC1DLucOWK2Y3cCn9GA=;
 b=BCrz/dvSgjvUZXfvH9H4+z9QT1uhoY0CIkFdQhVMwQNl7hnXvN9zraUJ6bWufAe1E9
 Bm81/pyfzGwBT+hnJ7Z+5mFjz16VkfUkbk59BHQCpGLc2rT/qbCsg3pjw7PjkeljRWjA
 ERB9HqartYGloLvYRvXD9P4nNN9/OlW4rKRKwaMR+gtPAtSEFvgsHS79V6dwOfv7LQKS
 jikupg+Rlz7HXeFQPtkustCThVek/SJvFSUwn8q5FezjYXZ6bs5eK91QK0ZvkoFDA6Gq
 HR1Racr4ibwCk9YzNSurkxC58qY0Rwk/yjsLqRKVJLh6LlWYyNl+1rIKu9zXgFtDZSo7
 VtRA==
X-Gm-Message-State: AOJu0YwvI6In/OWQdd1o/PoIKLRUCRGQ59aKw7+rFpbn5CCWWeM702Dp
 +UTDtL0hu6g5EbjrVNHKctQ/dZ4LRx/wfQ==
X-Received: by 2002:a17:907:b9c9:b0:a28:e4d3:7b1a with SMTP id
 xa9-20020a170907b9c900b00a28e4d37b1amr801141ejc.154.1704466006275; 
 Fri, 05 Jan 2024 06:46:46 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 jo21-20020a170906f6d500b00a275637e699sm942950ejb.166.2024.01.05.06.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 06:46:45 -0800 (PST)
Message-ID: <af352e7d-3346-4705-be77-6eed86858d18@linaro.org>
Date: Fri, 5 Jan 2024 15:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 03/25] memory: Have
 memory_region_init_rom_nomigrate() handler return a boolean
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C_=C3=A9_dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-4-philmd@linaro.org> <4h38a.h95poe276hnn@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4h38a.h95poe276hnn@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ukotqMVl4HWI

On 21/11/23 13:10, Manos Pitsidianakis wrote:
> On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> 
> wrote:
>> Following the example documented since commit e3fe3988d7 ("error:
>> Document Error API usage rules"), have cpu_exec_realizefn()
>> return a boolean indicating whether an error is set or not.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> include/exec/memory.h | 4 +++-
>> system/memory.c       | 8 ++++++--
>> 2 files changed, 9 insertions(+), 3 deletions(-)


>> diff --git a/system/memory.c b/system/memory.c
>> index 337b12a674..bfe0b62d59 100644
>> --- a/system/memory.c
>> +++ b/system/memory.c
>> @@ -1729,14 +1729,18 @@ void memory_region_init_alias(MemoryRegion *mr,
>>     mr->alias_offset = offset;
>> }
>>
>> -void memory_region_init_rom_nomigrate(MemoryRegion *mr,
>> +bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
>>                                       Object *owner,
>>                                       const char *name,
>>                                       uint64_t size,
>>                                       Error **errp)
>> {
>> -    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, 
>> errp);
>> +    bool rv;
>> +
>> +    rv = memory_region_init_ram_flags_nomigrate(mr, owner, name, 
>> size, 0, errp);
>>     mr->readonly = true;
>> +
> 
> By the way, do we want to set mr->readonly on failure? Should there be 
> modifications if an error is propagated upwards?

Good point, I'm squashing:

-- >8 --
diff --git a/system/memory.c b/system/memory.c
index a748de3694..72c6441e20 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1707,12 +1707,13 @@ bool 
memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                        uint64_t size,
                                        Error **errp)
  {
-    bool rv;
-
-    rv = memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 
0, errp);
+    if (!memory_region_init_ram_flags_nomigrate(mr, owner, name,
+                                                size, 0, errp)) {
+         return false;
+    }
      mr->readonly = true;

-    return rv;
+    return true;
  }
---
