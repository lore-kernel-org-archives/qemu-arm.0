Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1081445lfq;
        Thu, 8 Oct 2020 00:00:25 -0700 (PDT)
X-Received: by 2002:a1c:df55:: with SMTP id w82mr6894801wmg.41.1602140425283;
        Thu, 08 Oct 2020 00:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602140425; cv=none;
        d=google.com; s=arc-20160816;
        b=ie507t4v6FovW6uwiym5xbEQY4pAvWmsgZ0s1KpxtKSUnDzGO7RsTNB4lr8D+OiK/A
         SNqYGDx00VNrGauVl2GWHF1NEfWDiBB6FUK8ORA6LotBnDGErZTbQYf6eefqhYLovvod
         lErmGnnL0/yq8GDv61Z655S5IiDdaF16gi2LXunOHQRP9DBi1H6FoBlq7q8Bl09OJe/L
         ActWFtul3W8KJPcJeGecNtY8jVtxNIIHb5hPpfIjgj4XcfeH0JBQziFXF450VnbTrlIE
         eBt9Fs1NKaT3JZgfnoNEKsQ6RE+pkM5Pw3GQbH6Hx8Njf59WqHU2rKrJ4HDeBYoFRh/z
         cRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=B1gPZv/K/1QOE+fw+Tb0YCwidzcmfpZdp1fUq7jFMWQ=;
        b=EbcCN6ELk5W6s7ZPX0tnUkLI4Qd7qa7iuXPidIaU7v9ymxEtT5OKm3Hy+1z78birXq
         Mz3FWupJpiHdaQYl4NvvVKGG7nOMBrBwffaouoDKg2YJKvTAOnSFJmoC4lr4f6uaDhFF
         BJsOu1NHEQTBjSuFpk4epKj6xIk05xuB7Dcrd/dJhuci+8t2dQ25GBxacpFqP3nGCgO+
         00vfraly0DXMmd9pxY4DHeX1h20Q5ogpj5KGu4yL0RNSJgVViJGxe/CNlFHv8rZZQL45
         zGf6OXOc9hzbKircpy9KxWxnDqWmvFi9h6Z/qb5AiG7/SfysPdcOxLbSfGKfW2C2gy9Q
         QYGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=q8WijFik;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <74cmonty@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3sor2506406wro.30.2020.10.08.00.00.25
        (Google Transport Security);
        Thu, 08 Oct 2020 00:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=q8WijFik;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=B1gPZv/K/1QOE+fw+Tb0YCwidzcmfpZdp1fUq7jFMWQ=;
        b=q8WijFikJAGF5hFieOa1dHs5zghhttlji3PT/EgKjQOqG98qM3QqEXbpWbR04LHDM0
         G+DWp6olgE6UgCr8Azw4ag5eEv5s3dB40I4Zbl1HVswz48tJ16N/CMfCjUqGrthDpjwu
         OvlgpGQoqrHKZ5rUVcXAIIwlYdTe3c1APEm2/WUSEPul/8lEDPkzOS+U94ZpjXh8xLjw
         VmzRuXJl3RBh6Cn3uYmaSXE/cLdPiGLzE/epTgnrvxhCh7nlVeghrhkWkQxgNGu9Xsc4
         NFWXrVJEV+Jo+eJrtmMv18jd14Fvq4d70xAUiO3Leyko5Q06SaKCV8wgtGEas1vNpod7
         EXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=B1gPZv/K/1QOE+fw+Tb0YCwidzcmfpZdp1fUq7jFMWQ=;
        b=bB/SrERH8dkf3IxQgo38pWKiGl6oGXO7ft0czvn3URLydHuESlINRDX2Iy2DvOYjHw
         NWO5F4ZAzq6L8BkokjLI6xaU2tf3fumwixdkCl47BOGPXOCiXF9CMmNinM6K6OKuKCwv
         uVSy/GA753+S0RhsTHY/26wTR4pXJuR/c7LeWItcNZhVMqQuCe6fHjpgbUxlFcwkAz1V
         D7xNZiCH1itMvlrZ0iVLrdm9eFM3cti5p0HmshCdInbo7elewDIsCpwZ+p9l+zgOjaaw
         H6Bf1usok+Ps1ELP1ZBZdyHSRfgmoKKd80nfDWAe3W1T9/ANShf0vwcSiAsnJCs/BnV4
         JUZw==
X-Gm-Message-State: AOAM530FoVyP55r29stS5Ihv+No4h5NJDj5KJIsGpCGAUEmEACtFK5x+
	yCocGhI50h4GXr8hGpMwLPE=
X-Google-Smtp-Source: ABdhPJz8UkCU9WdqC6/mEl32HQcWjXxh3fLhZhWB3ghhroYA5LEhEX5483z5CjfB4gjkm0ySYKUpmw==
X-Received: by 2002:a5d:558e:: with SMTP id i14mr8003004wrv.40.1602140424898;
        Thu, 08 Oct 2020 00:00:24 -0700 (PDT)
Return-Path: <74cmonty@gmail.com>
Received: from [192.168.1.11] (b2b-94-79-184-225.unitymedia.biz. [94.79.184.225])
        by smtp.gmail.com with ESMTPSA id n2sm5890446wrt.82.2020.10.08.00.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 00:00:24 -0700 (PDT)
Subject: Re: Emulate Rpi with QEMU fails
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Paul Zimmerman <pauldzim@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com> <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
 <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
 <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com> <87blhe1esd.fsf@linaro.org>
 <f32593d0-e87b-0549-7b59-f58da24c9130@gmail.com> <87362q1bxl.fsf@linaro.org>
From: Thomas <74cmonty@gmail.com>
Autocrypt: addr=74cmonty@gmail.com; keydata=
 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
Message-ID: <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com>
Date: Thu, 8 Oct 2020 09:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87362q1bxl.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-TUID: Rsos3MbE9K1X

Interesting enough is: my top figure reported by perf is like yours:

Samples: 6M of event 'cycles:u', Event count (approx.): 1936571734942
Overhead  Command          Shared Object                  Symbol
   7,95%  qemu-system-arm  qemu-system-arm                [.]
helper_lookup_tb_ptr                                                        
◆
   4,16%  qemu-system-arm  qemu-system-arm                [.]
cpu_get_tb_cpu_state                                                        
▒
   2,52%  qemu-system-arm  libpthread-2.32.so             [.]
__pthread_mutex_lock                                                        
▒
   2,06%  qemu-system-arm  qemu-system-arm                [.]
qht_lookup_custom                                                           
▒
   1,66%  qemu-system-arm  qemu-system-arm                [.]
tlb_set_page_with_attrs                                                     
▒
   1,61%  qemu-system-arm  libpthread-2.32.so             [.]
__pthread_mutex_unlock_usercnt                                              
▒
   1,59%  qemu-system-arm  qemu-system-arm                [.]
get_phys_addr                                                               
▒
   1,27%  qemu-system-arm  qemu-system-arm                [.]
cpu_exec                                                                    
▒
   1,23%  qemu-system-arm  qemu-system-arm                [.]
object_class_dynamic_cast_assert                                            
▒
   0,98%  qemu-system-arm  libc-2.32.so                   [.]
_int_malloc                                                                 
▒
   0,95%  qemu-system-arm  qemu-system-arm                [.]
object_dynamic_cast_assert                                                  
▒
   0,95%  qemu-system-arm  qemu-system-arm                [.]
tb_htable_lookup                                                            
▒
   0,92%  qemu-system-arm  qemu-system-arm                [.]
tcg_gen_code                                                                
▒
   0,91%  qemu-system-arm  qemu-system-arm                [.]
qemu_mutex_lock_impl                                                        
▒
   0,75%  qemu-system-arm  qemu-system-arm                [.]
get_page_addr_code_hostp                                                    
▒
   0,73%  qemu-system-arm  qemu-system-arm                [.]
tcg_optimize                                                                
▒
   0,71%  qemu-system-arm  qemu-system-arm                [.]
qemu_mutex_unlock_impl                                                      
▒
   0,69%  qemu-system-arm  libc-2.32.so                   [.]
_int_free                                                                   
▒
   0,64%  qemu-system-arm  qemu-system-arm                [.]
tb_flush_jmp_cache                                                          
▒
   0,63%  qemu-system-arm  qemu-system-arm                [.]
address_space_ldl_le                                                        
▒
   0,62%  qemu-system-arm  libpthread-2.32.so             [.]
__lll_lock_wait                                                             
▒
   0,58%  qemu-system-arm  libpthread-2.32.so             [.]
pthread_cond_wait@@GLIBC_2.3.2                                              
▒
   0,52%  qemu-system-arm  qemu-system-arm                [.]
cpu_reset_interrupt                                                         
▒
   0,52%  qemu-system-arm  libc-2.32.so                   [.]
cfree@GLIBC_2.2.5                                                           
▒
   0,52%  qemu-system-arm  qemu-system-arm                [.]
qemu_set_irq                                                                
▒

However the absolute time is 3-4 minutes.
And I don't know where I should start optimization now.



Am 07.10.20 um 14:02 schrieb Alex Bennée:
> Thomas Schneider <74cmonty@gmail.com> writes:
>
>> Are you referring to this tool?
>> https://github.com/stefano-garzarella/qemu-boot-time 
>> <https://github.com/stefano-garzarella/qemu-boot-time>
> No - just plain perf:
>
>   perf record $QEMU $ARGS
>
> Then a "perf report" which will show you the hotspots, for example:
>
>    8.92%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup_tb_ptr
>    4.76%  qemu-system-aar  qemu-system-aarch64      [.] liveness_pass_1
>    3.69%  qemu-system-aar  qemu-system-aarch64      [.] tcg_gen_code
>    2.95%  qemu-system-aar  qemu-system-aarch64      [.] qht_lookup_custom
>    2.93%  qemu-system-aar  qemu-system-aarch64      [.] tcg_optimize
>    1.28%  qemu-system-aar  qemu-system-aarch64      [.] tcg_out_opc.isra.15
>    1.09%  qemu-system-aar  qemu-system-aarch64      [.] get_phys_addr_lpae
>    1.09%  qemu-system-aar  [kernel.kallsyms]        [k] isolate_freepages_block
>    1.05%  qemu-system-aar  qemu-system-aarch64      [.] cpu_get_tb_cpu_state
>    0.98%  qemu-system-aar  [kernel.kallsyms]        [k] do_syscall_64
>    0.94%  qemu-system-aar  qemu-system-aarch64      [.] tb_lookup_cmp
>    0.78%  qemu-system-aar  qemu-system-aarch64      [.] init_ts_info
>    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_htable_lookup
>    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_gen_code
>    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tlb_set_page_with_attrs
>
>>
>> Am 07.10.2020 um 13:00 schrieb Alex Bennée:
>>> perf to record your boot
>
