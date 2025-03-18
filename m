Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3136313njb;
        Tue, 18 Mar 2025 11:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXF6f4oyMhT/FmscJRNC+CozCKY/EKFUtVNW0CowoiH4Pap7xg4eEni22/OJt5xYf0JLrw8uwFUth9JVg==@linaro.org
X-Received: by 2002:adf:9b9d:0:b0:391:492a:c9c2 with SMTP id ffacd0b85a97d-3996b46895bmr4015908f8f.33.1742323485386;
        Tue, 18 Mar 2025 11:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742323485; cv=none;
        d=google.com; s=arc-20240605;
        b=S3vl1cbmJhT5fa9ExzgjhYBtLO5a6QzysW/UDW7x1/0DHX184x9ay+r/zrt4C+yLIO
         BJ6LXB2WbFNIDgNIWvE2LRHJYpt3yXKyagATBnwOgElYlkLhv4D45KuSlJ6myFv8FDZ7
         gucqSQEUX/ZFc0tuFS5xHK1hgqi9UyMSO9dNAkbkdphHsqMRoQUOxnzxC4vt0cPp8Py0
         VLXl6y1Vv2yPqvaxan3Fvc7Hcd/4EQWb2WfLiuxyDE2VOsnmck2IJfjLLu40D/bTwKT/
         zLM7DE4DXcZT0DYt4t64+HahjNfNCKAWp9E2Qo35nbZ1w6Gb8DQul4kiOtDNEqBu/Utr
         04GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/74e6taWSnZdXHpVWs74ehYusOf6mHllaULzT1w5Bx8=;
        fh=f/oQeUoFqYtV5olu08d6Da85n5iaiQVCmtINLwpmHCM=;
        b=L9MVvXdIghvqj0s1yGyfXAuhPiiuA+gu7uj77yOFZ3maGR1JQSOMU1CkeVE24MQdPF
         rK8PwJpO8g+/a1r2Bc4uC/JWOoCNoLixpkIWrCw7Xa8w8PHVC+oirBOvL0f6BGpP20So
         uBC5n+rv1tj8Mw9oaGhU2Cqgbe21+rx6w4EMbh6hd7n9U9wt9KzSzDbqcNNbwz2IqciZ
         plcs57l5AdOk2JxpJPw1laGBrSIMa+5l7ZdVGNPdS8q4V8P3DK1VAFEWgZsZI7eRQz3/
         kK7uk5yLBv7y1bk+fIj6+vCwBrGH1IPtQIzeLPfDhEtaadVLsvsNMFJcGGg9DZ8urMg1
         gsLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RSmzvsf8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-399733b6415sor15064f8f.0.2025.03.18.11.44.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 11:44:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RSmzvsf8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742323485; x=1742928285; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/74e6taWSnZdXHpVWs74ehYusOf6mHllaULzT1w5Bx8=;
        b=RSmzvsf85L4GGUPkLi5T0KDY2aNYvS7rm/GUahs5/k4bzakVmeQpDSzz3PeilMavhk
         r2Z3OL1UzYSBBIh2DpSNXDLpxbuvdopqm1fmL7L5Tl2qwa+wRTLJDLpkaDbuDdVBXSdA
         ludcF2pYZcT//T5kRD39To4RA+TuLDXzdQrE3msl1hiulNVNAz+V4qYw+UQTejIJgM/4
         Rn81gS2p8/24ThldGqBupaEH85Qr92uelQ+D1r7JqpqYCLOYFlKv2d+QNvGCiZsRAbz5
         sEPMnjaR4YFSfkQ0lWb9boT3l+WHjOrdgX9HNUqm9yb+uje6icPn7Ba11zZWaf2YrV73
         J9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323485; x=1742928285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/74e6taWSnZdXHpVWs74ehYusOf6mHllaULzT1w5Bx8=;
        b=mGUUItrffJkkEZ3EEv4jgULQS9tKXTD/GJFSWwbr8v7wrjc/200kf1JBeeZclifYq1
         pRQtmaEND3OFjz4RAjDH1zTd6HiMSyOqHJgdDuqBEstsa8EomLvSceW/GGcQHziYsMLu
         urpyIv+fEs2KtyfpdwCuZna6XOyHLsGld1AvXNgQlfyUW4uf63EWDKCSoLr8cAREZiJP
         4u8Vc/YOuZb+FYPL2NZKXJPDpBJYssmCoAWKFwoUVf2UpV5i74HYR5a+jOp92UY266Jw
         SyYoYMEfZk1ByWzdirc0xS0FURsV7Vijt0nnQkFtLvo1n03H11C8mefqqk76Vq3YZsbh
         y+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEtwE9MXE2ybVWIrtK3nY+EenBRCh7DvXoGSreNoTRS7ggCdhoEjrtxEVWo7ZS/yXdjCY2KwHJ1UEJow==@linaro.org
X-Gm-Message-State: AOJu0YxENto9bC9Dnb0JLCpIALfL697DZDl+RGBdixruOhfs+yerY5Kq
	BmgI0e7FlWhH1X60625bQM6M0BDZ6vO8OGUdiuRJ4OhgRdsDkywi/S3w+RfDJDzZcg==
X-Gm-Gg: ASbGncsuc0aaCLrmfZeXv/OkUAFrr9YQQl26f+gK82+gUfJwt7Crm5+h1rlChdn7F8b
	lcnZrfZJDdxlUvmy8n7iSUodKZGFnw/xnrj6Admsm65wHOniLpqfsbaTfTyUTrRKFkKLprZy16W
	mOn03RnykHsPoA+IX0GO0rjKMlyt+3gjTt5nKgYgPg/caa4EM56HkLu2A5pR8K/PfrsAeiI2XLo
	xBUpdVCCVhcZNf6CjKRPLMzJrr4jkoZ2bkekZyHA+RgAxRmQhk1fHfubq0PbBZJ/fcn71E+Nb9E
	sOzyVXg+QlTzTlTKvAhT4j4RipOElRL7jfRpY5zpb0IIgi8+SWp6He1e4O6Mj97VXNy+LRWlPtI
	YQyKBYKmKIAhgzHIsHy+hnlo=
X-Google-Smtp-Source: AGHT+IFkVGOmrvcSxc0T/uu8x/A0usu2Brk5uUuQYT3z4kvfwm+YufQaBC7XAgOvjeShp7rhcc8jAQ==
X-Received: by 2002:a5d:598d:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-3996b4a1e1dmr2951613f8f.52.1742323484762;
        Tue, 18 Mar 2025 11:44:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318aa1sm19381585f8f.64.2025.03.18.11.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 11:44:44 -0700 (PDT)
Message-ID: <45ded580-5593-469e-bffd-01fab1962b5a@linaro.org>
Date: Tue, 18 Mar 2025 19:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32
 emulation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org>
 <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
 <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dowEtSR1VbMP

On 18/3/25 18:50, Peter Maydell wrote:
> On Tue, 18 Mar 2025 at 17:42, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 18/3/25 05:51, Pierrick Bouvier wrote:
>>> Directly condition associated calls in target/arm/helper.c for now.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/cpu.h    | 8 --------
>>>    target/arm/helper.c | 6 ++++++
>>>    2 files changed, 6 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index 51b6428cfec..9205cbdec43 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -1222,7 +1222,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>>>     */
>>>    void arm_emulate_firmware_reset(CPUState *cpustate, int target_el);
>>>
>>> -#ifdef TARGET_AARCH64
>>>    int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>>>    int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>>>    void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>>> @@ -1254,13 +1253,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
>>>    #endif
>>>    }
>>>
>>> -#else
>>> -static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
>>> -static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>>> -                                         int n, bool a)
>>> -{ }
>>> -#endif
>>> -
>>>    void aarch64_sync_32_to_64(CPUARMState *env);
>>>    void aarch64_sync_64_to_32(CPUARMState *env);
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index b46b2bffcf3..774e1ee0245 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -6562,7 +6562,9 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>>         */
>>>        new_len = sve_vqm1_for_el(env, cur_el);
>>>        if (new_len < old_len) {
>>> +#ifdef TARGET_AARCH64
>>
>> What about using runtime check instead?
>>
>>    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && new_len < old_len) {
>>
> 
> That would be a dead check: it is not possible to get here
> unless ARM_FEATURE_AARCH64 is set.

So checks in callees such:

-- >8 --
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bb445e30cd1..8377eb0e710 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11547,5 +11547,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, 
unsigned vq)
      uint64_t pmask;
+    ARMCPU *cpu = env_archcpu(env);

+    assert(cpu_isar_feature(aa64_sve, cpu));
      assert(vq >= 1 && vq <= ARM_MAX_VQ);
-    assert(vq <= env_archcpu(env)->sve_max_vq);
+    assert(vq <= cpu->sve_max_vq);

---
