Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10313109wrv;
        Thu, 25 Jul 2019 00:54:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2yf4WrZt7eG2SheT97t3Q91Tb8HAgtbMk8k2Eiq8GriS/auqCRb5t9f2zeakIDKmDUqPa
X-Received: by 2002:a0c:d0fc:: with SMTP id b57mr62440707qvh.78.1564041253823;
        Thu, 25 Jul 2019 00:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564041253; cv=none;
        d=google.com; s=arc-20160816;
        b=rVlQ0BSHttEUU66lLgsEkesi2UhxVwZdpCAa5xWYIVUJReoet3+IbybujaGK16JFpd
         Hlec3qKBH10FN7azu6D9J9QmxwTnQkLKVLOD3p4eg0YGAHYZaZM2asJtLHtW1Bm4u5u3
         ENYlFeV5u+9Hz5e66tCgbpNvSpLApRu5MZxLtyT5YorDGEXVwpmCAdVpbYYdey6kgrhr
         5L4Wrd0C2uGEUjJcEMeYKWfByyFVSPd8dayQZCHjsJ8M5XV2XLVY2Yo00hc5+5x04z97
         19fQKBas5efkVnlNnVcOFgRyQwCndszK5GF2TMbYHn8yIUoE+pnwbHISyFckDi4oU7sR
         AEFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=v+mGXcvvTPOt+U7MivEF2pk2Cm1vZWUNVmZtTf9aJ60=;
        b=N9K0Xvt5EoG7K1MkXg2v2HBbu2U/kziI7tgI8yuU8PnCfEkjx0gO4IpafwzVQ4tElv
         ZT91tq/bb5L5oDQZYJUovm51eBn1CDcxdL3QKDZA+Jd8zctiAQok/DQ+2tafyCEm76qw
         VPhqZj5rpWwg7EYV37GZbbnwJBpOGLyEUzR6EaZcW93IhIJAEADM2cYih9bHssm4I92W
         ZThmHJFYQUYWLIJImBL7qsS170exuR6AAycyo/8Bgr/y8d572m96PtnjnMxvKmkwPBYA
         DCSMYJhv2kIrIyPxRF7H0Fadu96V0cXUc9PK57QTUO6v5lhQqxH5AC54WipzF53BHzWL
         fInQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x3si15726888qkn.31.2019.07.25.00.54.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 00:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CCAFC065116;
	Thu, 25 Jul 2019 07:54:12 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D80D45D9DE;
	Thu, 25 Jul 2019 07:54:09 +0000 (UTC)
Subject: Re: [PATCH v2 04/14] tests: arm: Introduce cpu feature tests
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-5-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <62c4c0cb-8b17-aea2-369c-61149e2c4df2@redhat.com>
Date: Thu, 25 Jul 2019 09:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 25 Jul 2019 07:54:12 +0000 (UTC)
X-TUID: 84nqwbVPQSWg

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> Now that Arm CPUs have advertised features lets add tests to ensure
> we maintain their expected availability with and without KVM.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/Makefile.include   |   5 +-
>  tests/arm-cpu-features.c | 221 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 225 insertions(+), 1 deletion(-)
>  create mode 100644 tests/arm-cpu-features.c
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index db750dd6d09b..d5f43fe03067 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -255,13 +255,15 @@ check-qtest-sparc64-$(CONFIG_ISA_TESTDEV) = tests/endianness-test$(EXESUF)
>  check-qtest-sparc64-y += tests/prom-env-test$(EXESUF)
>  check-qtest-sparc64-y += tests/boot-serial-test$(EXESUF)
>  
> +check-qtest-arm-y += tests/arm-cpu-features$(EXESUF)
>  check-qtest-arm-y += tests/microbit-test$(EXESUF)
>  check-qtest-arm-y += tests/m25p80-test$(EXESUF)
>  check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
>  check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
>  check-qtest-arm-y += tests/hexloader-test$(EXESUF)
>  
> -check-qtest-aarch64-y = tests/numa-test$(EXESUF)
> +check-qtest-aarch64-y += tests/arm-cpu-features$(EXESUF)
> +check-qtest-aarch64-y += tests/numa-test$(EXESUF)
>  check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
>  check-qtest-aarch64-y += tests/migration-test$(EXESUF)
>  # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
> @@ -822,6 +824,7 @@ tests/test-qapi-util$(EXESUF): tests/test-qapi-util.o $(test-util-obj-y)
>  tests/numa-test$(EXESUF): tests/numa-test.o
>  tests/vmgenid-test$(EXESUF): tests/vmgenid-test.o tests/boot-sector.o tests/acpi-utils.o
>  tests/cdrom-test$(EXESUF): tests/cdrom-test.o tests/boot-sector.o $(libqos-obj-y)
> +tests/arm-cpu-features$(EXESUF): tests/arm-cpu-features.o
>  
>  tests/migration/stress$(EXESUF): tests/migration/stress.o
>  	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,"LINK","$(TARGET_DIR)$@")
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> new file mode 100644
> index 000000000000..31b1c15bb979
> --- /dev/null
> +++ b/tests/arm-cpu-features.c
> @@ -0,0 +1,221 @@
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
> +static const char *resp_get_error(QDict *resp)
> +{
> +    QDict *qdict;
> +
> +    g_assert(resp);
> +    qdict = qdict_get_qdict(resp, "error");
> +    if (qdict) {
> +        return qdict_get_str(qdict, "desc");
> +    }
> +    return NULL;
> +}
> +
> +static char *get_error(QTestState *qts, const char *cpu_type,
> +                       const char *fmt, ...)
> +{
> +    QDict *resp;
> +    char *error;
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
> +    g_assert(resp);
> +    error = g_strdup(resp_get_error(resp));
> +    qobject_unref(resp);
> +
> +    return error;
> +}
> +
> +#define assert_error(qts, cpu_type, expected_error, fmt, ...)          \
> +({                                                                     \
> +    char *_error = get_error(qts, cpu_type, fmt, ##__VA_ARGS__);       \
> +    g_assert(_error);                                                  \
> +    g_assert(g_str_equal(_error, expected_error));                     \
> +    g_free(_error);                                                    \
> +})
> +
> +static QDict *resp_get_props(QDict *resp)
> +{
> +    QDict *qdict;
> +
> +    g_assert(resp);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qdict = qdict_get_qdict(resp, "return");
> +    g_assert(qdict_haskey(qdict, "model"));
> +    qdict = qdict_get_qdict(qdict, "model");
> +    g_assert(qdict_haskey(qdict, "props"));
> +    qdict = qdict_get_qdict(qdict, "props");
> +    return qdict;
> +}
> +
> +#define assert_has_feature(qts, cpu_type, feature)                     \
> +({                                                                     \
> +    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
> +    g_assert(_resp);                                                   \
> +    g_assert(qdict_get(resp_get_props(_resp), feature));               \
> +    qobject_unref(_resp);                                              \
> +})
> +
> +#define assert_has_not_feature(qts, cpu_type, feature)                 \
> +({                                                                     \
> +    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
> +    g_assert(_resp);                                                   \
> +    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
> +    qobject_unref(_resp);                                              \
> +})
> +
> +static void assert_type_full(QTestState *qts, const char *cpu_type)
nit: you don't really care about the cpu_type as static is not supported.
> +{
> +    const char *error;
> +    QDict *resp;
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
> +                            "'arguments': { 'type': 'static', "
> +                                           "'model': { 'name': %s }}}",
> +                     cpu_type);
> +    g_assert(resp);
> +    error = resp_get_error(resp);
> +    g_assert(error);
> +    g_assert(g_str_equal(error,
> +                         "The requested expansion type is not supported."));
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
> +    assert_type_full(qts, "foo");
> +    assert_bad_props(qts, "max");
> +    assert_error(qts, "foo", "The CPU definition 'foo' is unknown.", NULL);
> +    assert_error(qts, "max", "Parameter 'not-a-prop' is unexpected",
> +                 "{ 'not-a-prop': false }");
> +    assert_error(qts, "host", "The CPU definition 'host' requires KVM", NULL);
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
> +
> +    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +        assert_has_feature(qts, "host", "aarch64");
> +
> +        assert_error(qts, "cortex-a15",
> +            "The CPU definition 'cortex-a15' cannot "
> +            "be used with KVM on this host", NULL);
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

The code looks good to me. Assuming you updated the error strings
according to the previous discussion and test passes again, feel free to
add:

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
