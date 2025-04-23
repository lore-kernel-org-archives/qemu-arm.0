Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3020889njd;
        Wed, 23 Apr 2025 06:08:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2h7BWTYqNDUPjQm5nPbwbSqO3+UbJU790xAt00llTfkWfqez5/H8OKEmFt+B+fthScblw3LfJlgy8jw==@linaro.org
X-Google-Smtp-Source: AGHT+IFf7lFhs07cyUvr8I3jAn0LNxmCqqUmuzMoWvbeYpbm3Aig28IG+tC3JLVeC0UbY4N/cvNw
X-Received: by 2002:a05:600c:384f:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-4406abf94bamr154306445e9.23.1745413736347;
        Wed, 23 Apr 2025 06:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745413736; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5ERtY0/PFdQy5d1yiixMYJt7VPOPiIjvVvkXSmKfqXsTjm2bzF/Z44n9VKOD35izk
         5B31rbsAthpoYIWWyCCt31066VI3tf/gRBlAyKBG8byWM/Yyc7r+vFtNA8bYp9GElpD/
         TW8nLx/++aJo0jVZ4g0QgoW76uUHZzLOF/4T1HXc26oywwQjU+oc78TiVvhztuF0ZXvR
         xcB0gxMKCKPGh0pPIoAlm65Ibqbjk6Hd7bYSSg7tJZDzGpyCcUK88NEse9+P4XcX5rZK
         aLm6EslYeiDyX3WQPHoGzR4SBWT6PbkC0i1ryPOD6Y/dt4buQvvNqlZ+D0dpIret1/OH
         g+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=G7MOXb7iei5SBp2uU+O5T1v8tDsL72NTTh+ZlG98DO0=;
        fh=aCcJ4pfC9qJa+5aSSjQp4kZBJkalSbEckJ6Rg31MrSs=;
        b=LXNkjAgsWoStwCqubB2lVncFEyuQiGjRYOX0otNoGKu8fXxw6YmSEP408epHwxB1Dr
         aZL6B+WVUMgayZ6QU1FB5xZECXVn8SMAEBNbS7cTWMGGLkwYVlLqprDDlXW/I022bTSG
         fK05p6JNC5bD/MddyJpcKq9rRDBNaLC/lMgVyZAwHwWHbazxIEQcXzxPmwoZyLaIh0C/
         foQGr5ekeKaLQuZOrLR9+Gqn9dqwT/PemHS1uvkp/2b1iW/7r4dFXzkHHWeBat8GuCp8
         GXRhoVDOv1MaGzfqsCP6oQOqOsie2ni0Q1fLAfsSSPWJYeh93OSl+rxhndTWv+ApOEfS
         0bVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ct692q6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-44092d221a0si11834235e9.70.2025.04.23.06.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 06:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ct692q6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7ZqM-0007dt-1y; Wed, 23 Apr 2025 09:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u7ZqH-0007Pu-5u
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 09:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u7ZqC-0008Hu-IV
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 09:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745413719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G7MOXb7iei5SBp2uU+O5T1v8tDsL72NTTh+ZlG98DO0=;
 b=ct692q6AjWuZQ6ylPJpl4YglB7RYY/spomIpto2kyTuzB5V5VpmBZAwZbLfGf62VfjxVdb
 vncML6J7/oZzqaXbGSxqhYiwU1OwZrduX+UOOZZN/YpD+LVtqJDTq/S+iGqh4fxRFwPzua
 8XBUMxN/fG/mN05YP9H8K/E2qREggTM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-Lh7BdQM_PTCeBQTpxGJ2vg-1; Wed, 23 Apr 2025 09:08:37 -0400
X-MC-Unique: Lh7BdQM_PTCeBQTpxGJ2vg-1
X-Mimecast-MFC-AGG-ID: Lh7BdQM_PTCeBQTpxGJ2vg_1745413717
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-acb94dbd01fso145420466b.1
 for <qemu-arm@nongnu.org>; Wed, 23 Apr 2025 06:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745413716; x=1746018516;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7MOXb7iei5SBp2uU+O5T1v8tDsL72NTTh+ZlG98DO0=;
 b=uEEXYTkd4Lxi1kBOFjiKpfzFzM/YxhP++rLEkxkMdls6CYBmLVhbGqTUPFi+fRkHpO
 chL5adDRIGM+WEAMHir+S/OnxgI+I0nrHI2EkM0GJ40IJNBYO+hBgbnWaApDA/yDOt9f
 mUJt3F+NVGP4syyOGED8dIrdEA0FweQz8+D8lwYnd+Bfc/sMwzCKvx2PzrSYDw4wrOzD
 1YqCbbA2AT+llx2S9ht3rk/uN35ZIL9XUNQZ96Aevknq/y8HGa1zUUig1dvjvlPEYduw
 bTR2xCYCE6Dxzz5kWteJ2iIVDO4p5GVervvch/leFz25dURnVFs9jrYQOyrmMzFp6vXe
 K0Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2cPpwwuq10Uc37SON9hCKIAWMJyPGZgmPsIHjyDnrhuWhqNVrvI8gPg97DodY+ndAiwDWovFWPg==@nongnu.org
X-Gm-Message-State: AOJu0YweUjafq/hI8xctXi6FrXKTVwQuwe5bTHXWKGLqHFihIdYKPsQ1
 aUVh9L6GEKXbIS/F8M1liWSXzxy24INMXNw+gAenEUbD70hbHypbBOFKVjxjgabuz9wnpvqX1nQ
 JxG7uRHAOcw8ADiYjwZKlY9WmAcpedh9oAvwvpZZafMPySZPwAA==
X-Gm-Gg: ASbGncv7kxqBo6Fr7E66VOOREr5Wf0mE31VRJnI84cHHH1zteKxtd+xd0viI9USfIgX
 ZjVLjZVjASuy6E3qFTM2waNk7g5d44Q6UYkHT8jdT4/a6HxpEKp29S2GXLLPzu3Nb3FMjji6Uuh
 tzjAGT9VBM91fiz+GjJaCiNPRd24Zn9y/AGtKPQIv7PyyKO8EQ6yd8MgvvOX297DT7geqTaifMG
 oC+7SPsR0wlGPTu7/qs8De1tzoxGe4Q/SPuqHJ010KcS+JKWPbl6rCk4yY3J+IZgNwkCQhn67GL
 taZX3owdlxf453mE+w==
X-Received: by 2002:a17:907:9407:b0:ac7:391a:e159 with SMTP id
 a640c23a62f3a-acb74e01a3dmr1470042866b.60.1745413716592; 
 Wed, 23 Apr 2025 06:08:36 -0700 (PDT)
X-Received: by 2002:a17:907:9407:b0:ac7:391a:e159 with SMTP id
 a640c23a62f3a-acb74e01a3dmr1470038266b.60.1745413716114; 
 Wed, 23 Apr 2025 06:08:36 -0700 (PDT)
Received: from [192.168.58.123] ([151.49.233.241])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-acb6ec04802sm797226566b.30.2025.04.23.06.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:08:35 -0700 (PDT)
Message-ID: <275dd8a6-c4f7-47de-ac45-64612e14b8a7@redhat.com>
Date: Wed, 23 Apr 2025 15:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] tcg: allow tb_flags to be larger than 32bit
To: Ben Dooks <ben.dooks@codethink.co.uk>, richard.henderson@linaro.org,
 peter.maydell@linaro.org, mrolnik@gmail.com, brian.cain@oss.qualcomm.com,
 deller@gmx.de, zhao1.liu@intel.com, gaosong@loongson.cn, laurent@vivier.eu,
 edgar.iglesias@gmail.com, philmd@linaro.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, arikalo@gmail.com, shorne@gmail.com,
 npiggin@gmail.com, danielhb413@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 ysato@users.sourceforge.jp, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20250423100949.2047161-1-ben.dooks@codethink.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250423100949.2047161-1-ben.dooks@codethink.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0VhwhkXYdTFJMRj7jm2vLpHV3V3VwF0WcwCgscVWoFw_1745413717
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.294,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Km6dBarcFJJp

On 4/23/25 12:09, Ben Dooks wrote:
> In adding a new feature to the riscv target, it turns out the
> tb_flags had already got to the 32-bit limit. Everyone other target
> has been fine with uint32_t (except perhaps arm which does somethng
> strange to extend tb_flags, I think).
> 
> To allow extending of tb_flags to be bigger, change the uint32_t to 
> a tb_flags_t which a target can define to be bigger (and do this for 
> riscv as having tb_flags_t be uint64_t somewhere is necessary to
> pick out bugs in this translation).
> 
> This method of extension also stops having to go through each arch 
> fixing field usage and anything else that may arise, and given this 
> is currently only affecting the tcg, it can be done per target arch.
> 
> Note, target/riscv does not currently use any of the other flag bits 
> yet. The work is done as we would like to try the big-endian riscv 
> again and someone has already taken the last bit we where using at 
> (target/riscv/cpu.h#L666 adding PM_SIGNEXTEND where we had BE_DATA)

Leaving aside your patch I think you can improve the density of the 
tbflags a bit too:

- PM_MASK_ENABLED, PM_BASE_ENABLED and AXL are unused, which gives you 
back 4 bits.

- VLMUL == 4 is invalid, and you can use that to get rid of VILL

- SEW reserves 3 bits, but TCG only supports 8/16/32/64; that could be 
one more bit if you can live with the limitation

This is already 6 bits, but for FS and VS it may be efficient enough to 
have just one bit (dirty vs. everything else): for all cases other than 
dirty, REQUIRE_FPU and require_rv* can call a helper to look at the 
actual MSTATUS and generate the exception if the extension is disabled; 
then the caller always proceeds with translation into TCG ops(*).  The 
overhead for the DISABLED/INITIAL/CLEAN cases is minimal and it gives 
back 2 more bits.

Finally, in many cases it makes sense to do a full TB flush when CSRs
change.  However I am not sure if this could be done for RISC-V, maybe 
for the CFI enabled bits?

Thanks,

Paolo

(*) that is:

static bool require_rvv(DisasContext *s)
{
     REQUIRE_EXT(s, RVV);
     if (!s->mstatus_vs_dirty) {
         gen_helper_require_rvv(tcg_env);
     }
     return true;
}

static bool require_rvf(DisasContext *s)
{
     switch (s->sew) {
     case MO_16:
         if (!s->cfg_ptr->ext_zvfh) {
             return false;
         }
         break;
     case MO_32:
         if (s->cfg_ptr->ext_zve32f) {
             return false;
         }
         break;
     case MO_64:
         if (s->cfg_ptr->ext_zve64d) {
             return false;
         }
         break;
     default:
         return false;
     }

     if (!s->mstatus_fs_dirty) {
         gen_helper_require_rvf(tcg_env);
     }
     return true;
}

