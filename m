Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2153896njc;
        Mon, 22 Jul 2024 14:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVq1jQLpf/dNDlNIAWjviA9gc/TQTwhdchvD+lnyrOUn1pa11VstnRxe0lhwM6QeGk1/DJPHNbzzgLYYMNJ0dvwFiaAegkn
X-Received: by 2002:a05:600c:3b03:b0:425:7bbf:fd07 with SMTP id 5b1f17b1804b1-427dc515239mr55238815e9.5.1721684381015;
        Mon, 22 Jul 2024 14:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684380; cv=none;
        d=google.com; s=arc-20160816;
        b=IsDp88ZzUeO5VwxpPA0dUr20q6L+BpO+Vqa8s17H6Bh7txsCjdRQYsJvoHud5Su+GF
         zFTbxMIGKzSi9Ne5+ei1W+dn8ks+oMst6UvLVbONDNGq2zbkMtD4qj/cgUA7Te+d93He
         PmB99A6CU2AliTYwF3jFqZkg8/cFpES+Yt4LvQ3U19U8ANrAbztDaPcsVQJXf49ciXM/
         ObMPaL8ipgnzsSou6cUxD4/iXKs+DaphII7+IrGIFNH0p5Y5vqI41wSCjmk4u3ZsF7/d
         67gRe2QlUdqz/MYV5vRw8Z47EETBiKPuFz3dMnoib8EPejEq5TglZDFIOYK3r9tj8Zvc
         DCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dCrdl72LSWragEGP7BnhNbhzXcUtJIuMyH4LenVtq6M=;
        fh=wCUSkQicKq+ncrm5ex6TTrTzi7+UyCI/V7baB/Ii3R4=;
        b=tp3oPxNaJ4gibnBrQRAo/Mu4YwzIF8rMlnTog+vDL32kVhADz2qkJIlr4GBSV4jOHT
         FpnpfsgcrBceviXJN9uE1nHACn+Ml+IwAW2c9WC+xu554NMWfTCvqkeA8vLXBlbtEGU2
         8Hset46Q/aBm5DpxIWsiV72oPakOT7TNPM+0bwadkYxoWF/sykt1KmpJRB7jyCY86NFe
         nkyekGWWNgaClNADlN20D5Y/cCKIrCcmtpA8VXvhTBiG5G8k6xVfDirJx+NqKUqii4v1
         c/KOPMjiLg3CGU6YQm7VclqL3mUTAxo8MbUdYe/U0L/zjD7/ZE2UvW85p2GXKZgJV3j7
         g5MQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0fu1SUa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6fedba0sor22079315e9.13.2024.07.22.14.39.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 14:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0fu1SUa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721684380; x=1722289180; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCrdl72LSWragEGP7BnhNbhzXcUtJIuMyH4LenVtq6M=;
        b=L0fu1SUawZW6cleJ4wloUyMHIVftHO7F507Tt4q392QdpqynbFxPvTaxsMGO8mvndL
         sXXmz2EPmdC70VFTzRwDHqd81sYwbwPewgrCYitjpOgNRGaY5EA8HvygtcodbPUvXun4
         QK+EQSsf2rXr0X5PKLuEHz304+PJCo11Aq4F0PlaNUKnvIdT+e00hHhzpZkW9oEYK9Yn
         P22GKBWQS/10B9DpfM2Nocxa4Aqh0WaLmkCjJH5x7zdVHykdFrIzZM5UYBdbLbJusU49
         /dk4wVd4IV7PE1qo484VuZ2zC8QT4fVP3EEkyVOCym/51pNFaNbIAk4CcLz5mrcojJ4e
         SGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721684380; x=1722289180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCrdl72LSWragEGP7BnhNbhzXcUtJIuMyH4LenVtq6M=;
        b=OUhjH7C3OkSn3EsZrAMQDIkeZDEyLQd2qt76qbF8yiofEWWEEsjAm9C07w+Glgh1s2
         lrg9NW5FG8UL+BBI84JPZycHJapzqqwBYDsyoYV/VOLs7US0mhqsv6Oa2YlaiF6+Bq4F
         tkC7UwrbqeHxVGi4Fnur/02fnwfDcp7w4pSGj42jUUC5H6RO7hph8I9Fkp/hiyD3EXbm
         v4Pwjz6si8Opm4KIM/zFOTbc6RjR8v50IgAQ4DHmGIxinFDQoC2UowFLBeJjNDg+bYmU
         xI2KjVi54I9KauLSIMO5kiRlIhVSTTzFw9pp0xQdQbvoFs3Nag1Kp+LqocR3ytIXyxYT
         Bozg==
X-Forwarded-Encrypted: i=1; AJvYcCWTq+6pR7Gk9OWkFmxkHGAnu+02LMqWQW19tdB1omBTcV/IPd9O9BOQybrekVMF9M/c1tkmtxKBlWv5c28f4mnNUtfiVUVY
X-Gm-Message-State: AOJu0Yyt+ngcVravd/0PXYVbJbjjL0VZ1qYPDwmyKhTa/Ma/e/paKav3
	wCbjwUmSbf/Erg0Eg8PVe48IKsONjh2XbvQlSr28kpnoncU84D1aUfrMBA6OZKu/FA==
X-Google-Smtp-Source: AGHT+IGZscwFiaLWDTmSVk3DoLeljMoIcJHacnJhALDGrK7Km5wjNpG23V838AjCJsSD7IMP35+m0Q==
X-Received: by 2002:adf:a3c4:0:b0:360:9bf5:1eab with SMTP id ffacd0b85a97d-369bae48d87mr5287913f8f.36.1721684380323;
        Mon, 22 Jul 2024 14:39:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.208.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa493sm144900665e9.10.2024.07.22.14.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 14:39:39 -0700 (PDT)
Message-ID: <8fcc1b96-3b8e-4d5e-9154-3abf9b6f730b@linaro.org>
Date: Mon, 22 Jul 2024 23:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] util/fifo8: Expose fifo8_pop_buf()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-7-philmd@linaro.org>
 <7e222b69-49e6-4d0c-9b44-45c42e18cfb2@ilande.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7e222b69-49e6-4d0c-9b44-45c42e18cfb2@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wViqpNw7rTdX

Hi Mark,

On 22/7/24 23:26, Mark Cave-Ayland wrote:
> On 22/07/2024 17:07, Philippe Mathieu-Daudé wrote:
> 
>> Extract fifo8_pop_buf() from hw/scsi/esp.c and expose
>> it as part of the <qemu/fifo8.h> API. This function takes
>> care of non-contiguous (wrapped) FIFO buffer (which is an
>> implementation detail).
> 
> I wonder if it is also worth updating the comment for fifo8_pop_bufptr() 
> indicating that it returns a pointer to the internal buffer without 
> checking for overflow,

We document:

  * The function may return fewer bytes than requested when the data wraps
  * around in the ring buffer; in this case only a contiguous part of 
the data
  * is returned.

but I'll try to reword a bit.

> and that in general fifo8_pop_buf() is 
> recommended instead?

Yes, this was my first motivation but then I forgot to write it :)

BTW I now see fifo8_pop/peek_bufptr() as dangerous API and am thinking
of deprecating them (after release). AFAICT the difference is a pair of
memcpy(), when I expect to not be that important performance wise.

> Otherwise:
> 
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Thanks!

BTW I'll respin this series including the fifo8_peek_buf() patch that
I forgot and is the one I need in PL011. Preview:

+uint32_t fifo8_peek_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen)
+{
+    uint32_t tail_count, head_count = 0;
+
+    if (destlen == 0) {
+        return 0;
+    }
+
+    destlen = MIN(destlen, fifo->num);
+    tail_count = MIN(fifo->capacity - fifo->head, destlen);
+
+    if (dest) {
+        memcpy(dest, &fifo->data[fifo->head], tail_count);
+    }
+
+    /* Add FIFO wraparound if needed */
+    destlen -= tail_count;
+    head_count = MIN(destlen, fifo->head);
+    if (head_count && dest) {
+        memcpy(&dest[tail_count], &fifo->data[0], head_count);
+    }
+
+    return tail_count + head_count;
+}

---
