Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7051830wrm;
        Wed, 16 Oct 2019 05:05:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzInr0KfVYxW435H3gJyz9q7/IyYkBY5wL/FFE9no/VDh0sLW4LHuOTXoMsl3/enVEUWGwE
X-Received: by 2002:a92:1011:: with SMTP id y17mr11381358ill.234.1571227530415;
        Wed, 16 Oct 2019 05:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571227530; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7V0VF0ujGWHMbc+33aZAAo2Tn5/ALH/oRS0wbWPf3ixOXUQHIve3lEG2+8YjwdaSK
         Wq//6hDg2GaWNJEGFUurrXroBwrd4Mh4udCqIQUiwKm8AEP2fiLVTF6YcpOUenw7d1lE
         l1P4tTbY+yuLHNH2qqMA4RaKkMa/cC7BrO0OS/QoSCZaxM5idCIzG2pVfMTm0P6PUEVF
         05dehicFswn2IYNhm6L+dTbDYHH7OjvbRGf3Z0dg6KY8aLS4GE1anZbxnd0Q1m/hLcz4
         PTO53bLjhIVVREXWM03N5LFKAn9gcUAo9o1W1l6xGb57c7KhSAQdLgaSvC3dj8Vmt4ot
         8vCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=509I9WASuzQVkJvj/totZkrhhlBCM8zncHDmxD11nbo=;
        b=uz85eF1jvQNyBTjSir3GCH1DkpVZFbyyxe8f4EDUOc92irHLX4l1hkHmFBXi1AWwBY
         VjdNTNFA7qQK3rCU6BCWbynZArV5SunS3SvZqnw5cOYChN+45wJrL2CUkIrVN/vaU8uo
         zk/sGhNGecTCZKNBA6UOggxsJwwqmzuXcPcQrbMZWrQOeitg4BgHWx8vjyPG/0dAh64N
         jlBv57mhah1rCkzQWjtlj9ROzWQusVA5h7GmM4FPfJMZSM48PIuxPTaKkHMqw56Ol3+B
         FYgWcvb8IA0pl/27TJeKg84ZurtXlxgcKjMa/vOO7Zi1hTILJJFx5aP4s/PPyXgRHbO1
         h+Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g13si38452985jah.37.2019.10.16.05.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 05:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3927A4E926
	for <alex.bennee@linaro.org>; Wed, 16 Oct 2019 12:05:29 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id j2so2664627wrg.19
        for <alex.bennee@linaro.org>; Wed, 16 Oct 2019 05:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=509I9WASuzQVkJvj/totZkrhhlBCM8zncHDmxD11nbo=;
        b=OcI8SW/tSOXqfvrEAAARmxrQi4W3nlJMFRAfCMYN1lLcbl0zGq06AbtoDPokfgZc4G
         ufOQwDeJRt+AdRq87tgfvCJQ1OE+qKpKdrT4R2uCx36PHthCU9E7B3FbXp0c2BnVJzve
         kTSEJMeTnbgDk/+f8JKIeg0H+dPrgFQmSwt7XL2SCOyWupqxll1jTq6lthIQIaAZUS9M
         NxEpqMlTkMAkcVNrwLSJOvFAGQ1wlyPmrYeoOxueDblJH4ON7dzn7u9wbaSAizbu5Fub
         boteA5/0B7rQyz6274/0ev0JYCmONe5JSB9hMSG80iCKAqW41+DweeGXsYhSu53IT9fq
         z6Cg==
X-Gm-Message-State: APjAAAUUiJTMLGwWglEN7RBYImS6FbavfdSAEquw/VUPkTXeAOv2ibjT
	iPxzaqzjWPDQGgMLEyNp2H3tRmQoTjwrjMnUvLhDgyJyjfPWPsruw0ydOwv//L6iWODE3RJ0AJm
	MrYhOfaeQO/Mtll5X
X-Received: by 2002:a05:6000:149:: with SMTP id r9mr1599467wrx.90.1571227527879;
        Wed, 16 Oct 2019 05:05:27 -0700 (PDT)
X-Received: by 2002:a05:6000:149:: with SMTP id r9mr1599444wrx.90.1571227527587;
        Wed, 16 Oct 2019 05:05:27 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net. [88.21.201.14])
        by smtp.gmail.com with ESMTPSA id r27sm67126013wrc.55.2019.10.16.05.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 05:05:26 -0700 (PDT)
Subject: Re: [PATCH v6 2/9] tests: arm: Introduce cpu feature tests
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-3-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cec54f08-9508-13e5-600f-3442962a1642@redhat.com>
Date: Wed, 16 Oct 2019 14:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191016085408.24360-3-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: TLGlsd37RnME

Hi Andrew,

On 10/16/19 10:54 AM, Andrew Jones wrote:
> Now that Arm CPUs have advertised features lets add tests to ensure
> we maintain their expected availability with and without KVM.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/Makefile.include   |   5 +-
>   tests/arm-cpu-features.c | 242 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 246 insertions(+), 1 deletion(-)
>   create mode 100644 tests/arm-cpu-features.c
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 3543451ed309..8fd7c90b625e 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -255,6 +255,7 @@ check-qtest-sparc64-$(CONFIG_ISA_TESTDEV) = tests/endianness-test$(EXESUF)
>   check-qtest-sparc64-y += tests/prom-env-test$(EXESUF)
>   check-qtest-sparc64-y += tests/boot-serial-test$(EXESUF)
>   
> +check-qtest-arm-y += tests/arm-cpu-features$(EXESUF)
>   check-qtest-arm-y += tests/microbit-test$(EXESUF)
>   check-qtest-arm-y += tests/m25p80-test$(EXESUF)
>   check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
> @@ -262,7 +263,8 @@ check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
>   check-qtest-arm-y += tests/hexloader-test$(EXESUF)
>   check-qtest-arm-$(CONFIG_PFLASH_CFI02) += tests/pflash-cfi02-test$(EXESUF)
>   
> -check-qtest-aarch64-y = tests/numa-test$(EXESUF)
> +check-qtest-aarch64-y += tests/arm-cpu-features$(EXESUF)
> +check-qtest-aarch64-y += tests/numa-test$(EXESUF)
>   check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
>   check-qtest-aarch64-y += tests/migration-test$(EXESUF)
>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
> @@ -827,6 +829,7 @@ tests/test-qapi-util$(EXESUF): tests/test-qapi-util.o $(test-util-obj-y)
>   tests/numa-test$(EXESUF): tests/numa-test.o
>   tests/vmgenid-test$(EXESUF): tests/vmgenid-test.o tests/boot-sector.o tests/acpi-utils.o
>   tests/cdrom-test$(EXESUF): tests/cdrom-test.o tests/boot-sector.o $(libqos-obj-y)
> +tests/arm-cpu-features$(EXESUF): tests/arm-cpu-features.o
>   
>   tests/migration/stress$(EXESUF): tests/migration/stress.o
>   	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,"LINK","$(TARGET_DIR)$@")
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> new file mode 100644
> index 000000000000..198ff6d6b495
> --- /dev/null
> +++ b/tests/arm-cpu-features.c
> @@ -0,0 +1,242 @@
> +/*
> + * Arm CPU feature test cases
> + *
> + * Copyright (c) 2019 Red Hat Inc.
> + * Authors:
> + *  Andrew Jones <drjones@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qjson.h"
> +
> +#define MACHINE    "-machine virt,gic-version=max "
> +#define QUERY_HEAD "{ 'execute': 'query-cpu-model-expansion', " \
> +                     "'arguments': { 'type': 'full', "
> +#define QUERY_TAIL "}}"
> +
> +static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
> +{
> +    return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
> +                          QUERY_TAIL, cpu_type);
> +}
> +
> +static QDict *do_query(QTestState *qts, const char *cpu_type,
> +                       const char *fmt, ...)
> +{
> +    QDict *resp;
> +
> +    if (fmt) {
> +        QDict *args;
> +        va_list ap;
> +
> +        va_start(ap, fmt);
> +        args = qdict_from_vjsonf_nofail(fmt, ap);
> +        va_end(ap);
> +
> +        resp = qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s, "
> +                                                    "'props': %p }"
> +                              QUERY_TAIL, cpu_type, args);
> +    } else {
> +        resp = do_query_no_props(qts, cpu_type);
> +    }
> +
> +    return resp;
> +}
> +
> +static const char *resp_get_error(QDict *resp)
> +{
> +    QDict *qdict;
> +
> +    g_assert(resp);
> +
> +    qdict = qdict_get_qdict(resp, "error");
> +    if (qdict) {
> +        return qdict_get_str(qdict, "desc");
> +    }
> +    return NULL;
> +}
> +
> +#define assert_error(qts, cpu_type, expected_error, fmt, ...)          \
> +({                                                                     \
> +    QDict *_resp;                                                      \
> +    const char *_error;                                                \
> +                                                                       \
> +    _resp = do_query(qts, cpu_type, fmt, ##__VA_ARGS__);               \
> +    g_assert(_resp);                                                   \
> +    _error = resp_get_error(_resp);                                    \
> +    g_assert(_error);                                                  \
> +    g_assert(g_str_equal(_error, expected_error));                     \
> +    qobject_unref(_resp);                                              \
> +})
> +
> +static bool resp_has_props(QDict *resp)
> +{
> +    QDict *qdict;
> +
> +    g_assert(resp);
> +
> +    if (!qdict_haskey(resp, "return")) {
> +        return false;
> +    }
> +    qdict = qdict_get_qdict(resp, "return");
> +
> +    if (!qdict_haskey(qdict, "model")) {
> +        return false;
> +    }
> +    qdict = qdict_get_qdict(qdict, "model");
> +
> +    return qdict_haskey(qdict, "props");
> +}
> +
> +static QDict *resp_get_props(QDict *resp)
> +{
> +    QDict *qdict;
> +
> +    g_assert(resp);
> +    g_assert(resp_has_props(resp));
> +
> +    qdict = qdict_get_qdict(resp, "return");
> +    qdict = qdict_get_qdict(qdict, "model");
> +    qdict = qdict_get_qdict(qdict, "props");
> +    return qdict;
> +}
> +
> +#define assert_has_feature(qts, cpu_type, feature)                     \
> +({                                                                     \
> +    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
> +    g_assert(_resp);                                                   \
> +    g_assert(resp_has_props(_resp));                                   \
> +    g_assert(qdict_get(resp_get_props(_resp), feature));               \
> +    qobject_unref(_resp);                                              \
> +})
> +
> +#define assert_has_not_feature(qts, cpu_type, feature)                 \
> +({                                                                     \
> +    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
> +    g_assert(_resp);                                                   \
> +    g_assert(resp_has_props(_resp));                                   \
> +    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
> +    qobject_unref(_resp);                                              \
> +})
> +
> +static void assert_type_full(QTestState *qts)
> +{
> +    const char *error;
> +    QDict *resp;
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
> +                            "'arguments': { 'type': 'static', "
> +                                           "'model': { 'name': 'foo' }}}");
> +    g_assert(resp);
> +    error = resp_get_error(resp);
> +    g_assert(error);
> +    g_assert(g_str_equal(error,
> +                         "The requested expansion type is not supported"));
> +    qobject_unref(resp);
> +}
> +
> +static void assert_bad_props(QTestState *qts, const char *cpu_type)
> +{
> +    const char *error;
> +    QDict *resp;
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
> +                            "'arguments': { 'type': 'full', "
> +                                           "'model': { 'name': %s, "
> +                                                      "'props': false }}}",
> +                     cpu_type);
> +    g_assert(resp);
> +    error = resp_get_error(resp);
> +    g_assert(error);
> +    g_assert(g_str_equal(error,
> +                         "Invalid parameter type for 'props', expected: dict"));
> +    qobject_unref(resp);
> +}
> +
> +static void test_query_cpu_model_expansion(const void *data)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init(MACHINE "-cpu max");
> +
> +    /* Test common query-cpu-model-expansion input validation */
> +    assert_type_full(qts);
> +    assert_bad_props(qts, "max");
> +    assert_error(qts, "foo", "The CPU type 'foo' is not a recognized "
> +                 "ARM CPU type", NULL);
> +    assert_error(qts, "max", "Parameter 'not-a-prop' is unexpected",
> +                 "{ 'not-a-prop': false }");
> +    assert_error(qts, "host", "The CPU type 'host' requires KVM", NULL);
> +
> +    /* Test expected feature presence/absence for some cpu types */
> +    assert_has_feature(qts, "max", "pmu");
> +    assert_has_feature(qts, "cortex-a15", "pmu");
> +    assert_has_not_feature(qts, "cortex-a15", "aarch64");
> +
> +    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +        assert_has_feature(qts, "max", "aarch64");
> +        assert_has_feature(qts, "cortex-a57", "pmu");
> +        assert_has_feature(qts, "cortex-a57", "aarch64");
> +
> +        /* Test that features that depend on KVM generate errors without. */
> +        assert_error(qts, "max",
> +                     "'aarch64' feature cannot be disabled "
> +                     "unless KVM is enabled and 32-bit EL1 "
> +                     "is supported",
> +                     "{ 'aarch64': false }");
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_query_cpu_model_expansion_kvm(const void *data)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init(MACHINE "-accel kvm -cpu host");
> +
> +    assert_has_feature(qts, "host", "pmu");

Have you tried this on a ARM host? I wanted to but don't have access to 
one :(

> +
> +    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +        assert_has_feature(qts, "host", "aarch64");
> +
> +        assert_error(qts, "cortex-a15",
> +            "We cannot guarantee the CPU type 'cortex-a15' works "
> +            "with KVM on this host", NULL);
> +    } else {
> +        assert_error(qts, "host",
> +                     "'pmu' feature not supported by KVM on this host",
> +                     "{ 'pmu': true }");
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    bool kvm_available = false;
> +
> +    if (!access("/dev/kvm",  R_OK | W_OK)) {
> +#if defined(HOST_AARCH64)
> +        kvm_available = g_str_equal(qtest_get_arch(), "aarch64");
> +#elif defined(HOST_ARM)
> +        kvm_available = g_str_equal(qtest_get_arch(), "arm");
> +#endif
> +    }
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_data_func("/arm/query-cpu-model-expansion",
> +                        NULL, test_query_cpu_model_expansion);
> +
> +    if (kvm_available) {
> +        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
> +                            NULL, test_query_cpu_model_expansion_kvm);
> +    }
> +
> +    return g_test_run();
> +}
> 
