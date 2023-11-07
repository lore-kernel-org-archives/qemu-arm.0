Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp191815ejv;
        Tue, 7 Nov 2023 01:33:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp7q9xltHNjk3vbvIJy6ZSXnnjdITZ4Epzc7wnJVOvxOuYWvEF5cLO6chUyAoCVt8+d3tG
X-Received: by 2002:a5d:47c4:0:b0:32f:c5ea:72ac with SMTP id o4-20020a5d47c4000000b0032fc5ea72acmr8675914wrc.46.1699349606704;
        Tue, 07 Nov 2023 01:33:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699349606; cv=none;
        d=google.com; s=arc-20160816;
        b=Oo+G9+/wiJ5xWgemPCOAA/Ms/EsrrakRFTAFIKPRRsTjyOBcJnhKizKp2PqEHH8tm9
         eoLNy/t9bIoQ5Nom5vENrUtkpQKLbaJ0ae+mNDpAdvyuqWGAJb//Hyb5d44SJKGe1nZ4
         KRSTwkedy9vHEq7np1poIeRV7tuV/wh66enBl4ISwpqaycXzl33R1UQIc2I3DNYEWaj3
         51dYUuRcu6jJLFiFtFL8UkrNtNJ2iutTZI9UbJwKDkB4ROU3pD7PuBfUApagvd9jrUIH
         +pPAqu7xOCM/GyU9tElMsog+RoEq8VriH+8zm3KaBvoy7fFSwaVzuBjRlRu0cGp2/DCE
         zAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IS+F/DAHLQyzyUl7ElDkxZi8lQbuBh5x9ZsHCNZc2+M=;
        fh=jIg+bK0iN2RcBySFHjtORnfJd7NTQNmYAP3yAhfpabI=;
        b=DmXKNyBY1LyPhjWl7OPWd8DZO2O1yVTV9FXc8EtklvF9D1gdWEXerhDMzI10NEOrGr
         q7ytVK4VaqmoHE84Juk05DmoUzE/Ul/xU/3VuPw6c6338kvRUAZpuxLeTuYJUTTTIvFJ
         mayytiCwwpFLOBoSj3Ss86BNuUBKXGnB4vHfz7BqAbSR0wTmjrUfg59H+9X5IYfFlHso
         e/UunBhFJHI0sdCRi9ugxZ5PCMwjAHoMwGwuZL55x4gT/+64rv9i81g91C16q5TmA+Z9
         h5WXNojkSOhay4GNCSqwXwH8wowirbmbTYL3TebT3Ww3/Brq10IuVP7KSj10EjKS7y7S
         Q19g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Zi0zCO/8";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o15-20020a5d47cf000000b0032f7d9d05f8si1395436wrc.276.2023.11.07.01.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 01:33:26 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Zi0zCO/8";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699349605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS+F/DAHLQyzyUl7ElDkxZi8lQbuBh5x9ZsHCNZc2+M=;
	b=Zi0zCO/8FBhUKhNyXSqbP37+zCGQrzWFiLWta44sJ97UHWi3lE6Aid71Dmdg3bNnQO6xvK
	2CooawUwfVaRw78ZYwdiTYbJhS0mxbaXypR0odKsfJKeLPmss3er3iFnJOAxGgrombCTHz
	vj15HQNxrSEB5wtI/go9f0dOEpmSS4I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-ixDlDiNbNeis_KdTEVpkig-1; Tue, 07 Nov 2023 04:33:24 -0500
X-MC-Unique: ixDlDiNbNeis_KdTEVpkig-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-407d3e55927so34278385e9.1
        for <alex.bennee@linaro.org>; Tue, 07 Nov 2023 01:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699349601; x=1699954401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IS+F/DAHLQyzyUl7ElDkxZi8lQbuBh5x9ZsHCNZc2+M=;
        b=KyzxYWkuX94Xx7i2LFpPfxRf0BFXQtGNXe4ufXCJjorfat18JFMT6WTzu7jiZutQIm
         zdw2FWfV/e4Di+pGgOyprDLRTRpd2J+gMK9FxVbeKst4EsrS62ffSxkWiY/PONfFh96M
         knG064scxwXGYrtDPn+OyfmKKgdVgQEY+7zpnOSNdP4X2kWlP3feNAX7+pNE/QleFn+Y
         9/yPF4wDpdNqCQTarmZBIavopK0lRO0IdVCow+jTxTkmUUbcodqe4b6LCn67OBWSHH1v
         KCV1Vsw9XoGR4qlUBM9BMqawk2sdak3iHqmQ3Cbbyh5A3eih3eWCIMAvzeWYZafSUZWo
         LHKA==
X-Gm-Message-State: AOJu0YyGySGF4t/hpUtmBItMAAojQF93Mc+CekHzJL4NBzik55rSxXEy
	JvHCOT9ApqPe/fPWJZDlsCiBJ0pssZjeGGu+R7yCSZMsHyTmns7sEIbdvUs4vOgC+ZAQucCpW2X
	iFVmvEWtH/nHlYeF08Kz35gJYdYzOU5p+lOLx3WDHQPta5yUtEiSQSx4KkOWdO/kND24BbKGhSg
	gK
X-Received: by 2002:a05:600c:4f51:b0:406:535a:cfb4 with SMTP id m17-20020a05600c4f5100b00406535acfb4mr1862703wmq.1.1699349601425;
        Tue, 07 Nov 2023 01:33:21 -0800 (PST)
X-Received: by 2002:a05:600c:4f51:b0:406:535a:cfb4 with SMTP id m17-20020a05600c4f5100b00406535acfb4mr1862669wmq.1.1699349600932;
        Tue, 07 Nov 2023 01:33:20 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id fm15-20020a05600c0c0f00b00405391f485fsm15356005wmb.41.2023.11.07.01.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 01:33:20 -0800 (PST)
Message-ID: <327fc2bb-62e8-4bb8-b530-8e375581c5a1@redhat.com>
Date: Tue, 7 Nov 2023 10:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] plugins: add dllexport and dllimport to api funcs
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Manning <gmanning@rapitasystems.com>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-14-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20231106185112.2755262-14-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OWNhGnW0fpUL

On 11/6/23 19:51, Alex Bennée wrote:
> From: Greg Manning <gmanning@rapitasystems.com>
> 
> In qemu-plugin.h, mark all API functions as __declspec(dllexport) when
> compiling the executables, and as __declspec(dllimport) when being used
> to compile plugins against.
> 
> Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231102172053.17692-2-gmanning@rapitasystems.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   include/qemu/qemu-plugin.h | 50 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 50a9957279..4daab6efd2 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -22,15 +22,18 @@
>    *   https://gcc.gnu.org/wiki/Visibility
>    */
>   #if defined _WIN32 || defined __CYGWIN__
> -  #ifdef BUILDING_DLL
> -    #define QEMU_PLUGIN_EXPORT __declspec(dllexport)
> -  #else
> +  #ifdef CONFIG_PLUGIN
>       #define QEMU_PLUGIN_EXPORT __declspec(dllimport)
> +    #define QEMU_PLUGIN_API __declspec(dllexport)
> +  #else
> +    #define QEMU_PLUGIN_EXPORT __declspec(dllexport)
> +    #define QEMU_PLUGIN_API __declspec(dllimport)
>     #endif
>     #define QEMU_PLUGIN_LOCAL
>   #else
>     #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
>     #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
> +  #define QEMU_PLUGIN_API
>   #endif
>   
>   /**
> @@ -147,6 +150,7 @@ typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
>    *
>    * Note: Calling this function from qemu_plugin_install() is a bug.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
>   
>   /**
> @@ -160,6 +164,7 @@ void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
>    * Plugins are reset asynchronously, and therefore the given plugin receives
>    * callbacks until @cb is called.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
>   
>   /**
> @@ -171,6 +176,7 @@ void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
>    *
>    * See also: qemu_plugin_register_vcpu_exit_cb()
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
>                                          qemu_plugin_vcpu_simple_cb_t cb);
>   
> @@ -183,6 +189,7 @@ void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
>    *
>    * See also: qemu_plugin_register_vcpu_init_cb()
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
>                                          qemu_plugin_vcpu_simple_cb_t cb);
>   
> @@ -193,6 +200,7 @@ void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
>    *
>    * The @cb function is called every time a vCPU idles.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
>                                          qemu_plugin_vcpu_simple_cb_t cb);
>   
> @@ -203,6 +211,7 @@ void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
>    *
>    * The @cb function is called every time a vCPU resumes execution.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
>                                            qemu_plugin_vcpu_simple_cb_t cb);
>   
> @@ -253,6 +262,7 @@ typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
>    * callbacks to be triggered when the block or individual instruction
>    * executes.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
>                                              qemu_plugin_vcpu_tb_trans_cb_t cb);
>   
> @@ -265,6 +275,7 @@ void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
>    *
>    * The @cb function is called every time a translated unit executes.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
>                                             qemu_plugin_vcpu_udata_cb_t cb,
>                                             enum qemu_plugin_cb_flags flags,
> @@ -296,6 +307,7 @@ enum qemu_plugin_op {
>    * Note: ops are not atomic so in multi-threaded/multi-smp situations
>    * you will get inexact results.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
>                                                 enum qemu_plugin_op op,
>                                                 void *ptr, uint64_t imm);
> @@ -309,6 +321,7 @@ void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
>    *
>    * The @cb function is called every time an instruction is executed
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
>                                               qemu_plugin_vcpu_udata_cb_t cb,
>                                               enum qemu_plugin_cb_flags flags,
> @@ -324,6 +337,7 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
>    * Insert an inline op to every time an instruction executes. Useful
>    * if you just want to increment a single counter somewhere in memory.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
>                                                   enum qemu_plugin_op op,
>                                                   void *ptr, uint64_t imm);
> @@ -334,6 +348,7 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
>    *
>    * Returns: number of instructions in this block
>    */
> +QEMU_PLUGIN_API
>   size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
>   
>   /**
> @@ -342,6 +357,7 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
>    *
>    * Returns: virtual address of block start
>    */
> +QEMU_PLUGIN_API
>   uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
>   
>   /**
> @@ -355,6 +371,7 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
>    *
>    * Returns: opaque handle to instruction
>    */
> +QEMU_PLUGIN_API
>   struct qemu_plugin_insn *
>   qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
>   
> @@ -368,6 +385,7 @@ qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
>    * Returns: pointer to a stream of bytes containing the value of this
>    * instructions opcode.
>    */
> +QEMU_PLUGIN_API
>   const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
>   
>   /**
> @@ -376,6 +394,7 @@ const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
>    *
>    * Returns: size of instruction in bytes
>    */
> +QEMU_PLUGIN_API
>   size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
>   
>   /**
> @@ -384,6 +403,7 @@ size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
>    *
>    * Returns: virtual address of instruction
>    */
> +QEMU_PLUGIN_API
>   uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
>   
>   /**
> @@ -392,6 +412,7 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
>    *
>    * Returns: hardware (physical) target address of instruction
>    */
> +QEMU_PLUGIN_API
>   void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
>   
>   /**
> @@ -410,6 +431,7 @@ struct qemu_plugin_hwaddr;
>    *
>    * Returns: size of access in ^2 (0=byte, 1=16bit, 2=32bit etc...)
>    */
> +QEMU_PLUGIN_API
>   unsigned int qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info);
>   /**
>    * qemu_plugin_mem_is_sign_extended() - was the access sign extended
> @@ -417,6 +439,7 @@ unsigned int qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info);
>    *
>    * Returns: true if it was, otherwise false
>    */
> +QEMU_PLUGIN_API
>   bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
>   /**
>    * qemu_plugin_mem_is_big_endian() - was the access big endian
> @@ -424,6 +447,7 @@ bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
>    *
>    * Returns: true if it was, otherwise false
>    */
> +QEMU_PLUGIN_API
>   bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
>   /**
>    * qemu_plugin_mem_is_store() - was the access a store
> @@ -431,6 +455,7 @@ bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
>    *
>    * Returns: true if it was, otherwise false
>    */
> +QEMU_PLUGIN_API
>   bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
>   
>   /**
> @@ -446,6 +471,7 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
>    * information about the handle should be recovered before the
>    * callback returns.
>    */
> +QEMU_PLUGIN_API
>   struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
>                                                     uint64_t vaddr);
>   
> @@ -462,6 +488,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
>    * Returns true if the handle's memory operation is to memory-mapped IO, or
>    * false if it is to RAM
>    */
> +QEMU_PLUGIN_API
>   bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
>   
>   /**
> @@ -473,12 +500,14 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
>    * Note that the returned physical address may not be unique if you are dealing
>    * with multiple address spaces.
>    */
> +QEMU_PLUGIN_API
>   uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
>   
>   /*
>    * Returns a string representing the device. The string is valid for
>    * the lifetime of the plugin.
>    */
> +QEMU_PLUGIN_API
>   const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h);
>   
>   /**
> @@ -513,6 +542,7 @@ typedef void (*qemu_plugin_vcpu_mem_cb_t) (unsigned int vcpu_index,
>    * callback so the plugin is responsible for ensuring it doesn't get
>    * confused by making appropriate use of locking if required.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
>                                         qemu_plugin_vcpu_mem_cb_t cb,
>                                         enum qemu_plugin_cb_flags flags,
> @@ -531,6 +561,7 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
>    * instruction. This provides for a lightweight but not thread-safe
>    * way of counting the number of operations done.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
>                                             enum qemu_plugin_mem_rw rw,
>                                             enum qemu_plugin_op op, void *ptr,
> @@ -544,6 +575,7 @@ typedef void
>                                    uint64_t a3, uint64_t a4, uint64_t a5,
>                                    uint64_t a6, uint64_t a7, uint64_t a8);
>   
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
>                                             qemu_plugin_vcpu_syscall_cb_t cb);
>   
> @@ -551,6 +583,7 @@ typedef void
>   (*qemu_plugin_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_idx,
>                                        int64_t num, int64_t ret);
>   
> +QEMU_PLUGIN_API
>   void
>   qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
>                                            qemu_plugin_vcpu_syscall_ret_cb_t cb);
> @@ -563,6 +596,7 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
>    * Returns an allocated string containing the disassembly
>    */
>   
> +QEMU_PLUGIN_API
>   char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
>   
>   /**
> @@ -572,6 +606,7 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
>    * Return a static string referring to the symbol. This is dependent
>    * on the binary QEMU is running having provided a symbol table.
>    */
> +QEMU_PLUGIN_API
>   const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
>   
>   /**
> @@ -583,9 +618,11 @@ const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
>    *
>    * See also: qemu_plugin_register_vcpu_init_cb()
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
>                                  qemu_plugin_vcpu_simple_cb_t cb);
>   
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
>                                      qemu_plugin_simple_cb_t cb);
>   
> @@ -602,6 +639,7 @@ void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
>    * In user-mode it is possible a few un-instrumented instructions from
>    * child threads may run before the host kernel reaps the threads.
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
>                                       qemu_plugin_udata_cb_t cb, void *userdata);
>   
> @@ -615,6 +653,7 @@ int qemu_plugin_n_max_vcpus(void);
>    * qemu_plugin_outs() - output string via QEMU's logging system
>    * @string: a string
>    */
> +QEMU_PLUGIN_API
>   void qemu_plugin_outs(const char *string);
>   
>   /**
> @@ -628,6 +667,7 @@ void qemu_plugin_outs(const char *string);
>    * returns true if the combination @name=@val parses correctly to a boolean
>    * argument, and false otherwise
>    */
> +QEMU_PLUGIN_API
>   bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
>   
>   /**
> @@ -638,6 +678,7 @@ bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
>    * return NULL. The user should g_free() the string once no longer
>    * needed.
>    */
> +QEMU_PLUGIN_API
>   const char *qemu_plugin_path_to_binary(void);
>   
>   /**
> @@ -646,6 +687,7 @@ const char *qemu_plugin_path_to_binary(void);
>    * Returns the nominal start address of the main text segment in
>    * user-mode. Currently returns 0 for system emulation.
>    */
> +QEMU_PLUGIN_API
>   uint64_t qemu_plugin_start_code(void);
>   
>   /**
> @@ -654,6 +696,7 @@ uint64_t qemu_plugin_start_code(void);
>    * Returns the nominal end address of the main text segment in
>    * user-mode. Currently returns 0 for system emulation.
>    */
> +QEMU_PLUGIN_API
>   uint64_t qemu_plugin_end_code(void);
>   
>   /**
> @@ -662,6 +705,7 @@ uint64_t qemu_plugin_end_code(void);
>    * Returns the nominal entry address of the main text segment in
>    * user-mode. Currently returns 0 for system emulation.
>    */
> +QEMU_PLUGIN_API
>   uint64_t qemu_plugin_entry_code(void);
>   
>   #endif /* QEMU_QEMU_PLUGIN_H */
