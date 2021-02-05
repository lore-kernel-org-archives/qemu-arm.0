Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2101525lfo;
        Fri, 5 Feb 2021 07:22:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwn/40l+3+IwrNYIJbGZbXubxwfjCLQQWvdprX7liOVlxKk5unMMXmAUPvKDg/O5xuvzj/H
X-Received: by 2002:a25:7706:: with SMTP id s6mr6954549ybc.3.1612538534272;
        Fri, 05 Feb 2021 07:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612538534; cv=none;
        d=google.com; s=arc-20160816;
        b=ggU7EXjVR7I5focqkj+1ksHFz2BAfxWy+X4zzYpbZhkvzaitHe9WzZ9gMPJVZrJAoW
         e76rESwHiaJiwpYy+ZpeO069sgGelwBHnqZtD9apucQ3DSbYnsm2FwKLK+mGmemhDW6V
         SGcD5QVLNMxh3D9/JNW6uJLhFfQlyrWAmzqPHNcH1zWJ8L3tbx1N38ArcIFKF1sA5ZI3
         q/Bbqp3A/eT8+Xn+U+Wfc/Gvlcdtv13ec18JVE9zWpUvn4eqpjtfbYv4MD5rsrxt4bbP
         zyNo3GftqYL0kMtl46LCDFrWY2WzKrO9LYRMy6sZwAgIUjxfaikJSNvAqPLmLxe3lMzs
         Lj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=0HFTe0RLtXhs/6vM9AXvw3XPMp6Kwemg2OCnLI4G9NY=;
        b=l2xF90rYjxd5nvhCq3TzGfhWRIcb1lWlruM4Kj3o/8B81rdYYF9G2zfWYqiYQLauLc
         uPHQYzzJ7MpyVI+er3ZYYhJWugw45465PTviviRQtF8p8Whg55n9ZnktlAP8SmhnNNVi
         G4t0y63NFnDFlX10kWSXPaYIh0gKP1Os+9FQve1LZk4Tv0/16m09H+iaPcD9H5OgDZgp
         v9B7aZQJ7yBBprt2kkAm9EzbeKToF3jhBTBUJZAFJbvuGptymWUxTmScXZ9KrK44vebc
         +stZ+nB3TLkPo5otixnPoLXPuBsQJauM5YkHr4Yt2edr2rmXyHkTTcl5mogSXJqjd/kK
         dllQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si8503878ybj.426.2021.02.05.07.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82w1-0002KO-JH
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l82uf-0000HO-Uv; Fri, 05 Feb 2021 10:20:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:59720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l82ue-0001WO-4F; Fri, 05 Feb 2021 10:20:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C376B128;
 Fri,  5 Feb 2021 15:20:44 +0000 (UTC)
Subject: Re: [RFC PATCH 9/9] tests/qtest/arm-cpu-features: Restrict TCG-only
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-10-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <17a58366-a25e-1c9b-eeba-2924803a48e7@suse.de>
Date: Fri, 5 Feb 2021 16:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hljg6kODppkm

On 2/5/21 3:43 PM, Philippe Mathieu-Daudé wrote:
> Some tests explicitly request the TCG accelerator. As these
> tests will obviously fails if TCG is not present, disable
> them in such case.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> 
> RFC because of the TODO.
> 
> Roman posted a series to have a QMP command to query enabled
> accelerators.
> ---
>  tests/qtest/arm-cpu-features.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index c59c3cb002b..c6e86282b66 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -20,7 +20,7 @@
>   */
>  #define SVE_MAX_VQ 16
>  
> -#define MACHINE     "-machine virt,gic-version=max -accel tcg "
> +#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
>  #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
>  #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                      "  'arguments': { 'type': 'full', "
> @@ -41,6 +41,16 @@ static bool kvm_enabled(QTestState *qts)
>      return enabled;
>  }
>  
> +static bool tcg_enabled(QTestState *qts)
> +{
> +    /* TODO: Implement QMP query-accel? */
> +#ifdef CONFIG_TCG
> +    return true;
> +#else
> +    return false;
> +#endif /* CONFIG_TCG */


I would not use the same name as the existing tcg_enabled(), which has different semantics, even in test code;

what you mean here is tcg_available() right?



> +}
> +
>  static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>  {
>      return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
> @@ -352,7 +362,12 @@ static void sve_tests_sve_max_vq_8(const void *data)
>  {
>      QTestState *qts;
>  
> -    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
> +    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
> +
> +    if (!tcg_enabled(qts)) {
> +        qtest_quit(qts);
> +        return;
> +    }
>  
>      assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
>  
> @@ -387,7 +402,12 @@ static void sve_tests_sve_off(const void *data)
>  {
>      QTestState *qts;
>  
> -    qts = qtest_init(MACHINE "-cpu max,sve=off");
> +    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
> +
> +    if (!tcg_enabled(qts)) {
> +        qtest_quit(qts);
> +        return;
> +    }
>  
>      /* SVE is off, so the map should be empty. */
>      assert_sve_vls(qts, "max", 0, NULL);
> @@ -443,7 +463,12 @@ static void test_query_cpu_model_expansion(const void *data)
>  {
>      QTestState *qts;
>  
> -    qts = qtest_init(MACHINE "-cpu max");
> +    qts = qtest_init(MACHINE_TCG "-cpu max");
> +
> +    if (!tcg_enabled(qts)) {
> +        qtest_quit(qts);
> +        return;
> +    }
>  
>      /* Test common query-cpu-model-expansion input validation */
>      assert_type_full(qts);
> 

