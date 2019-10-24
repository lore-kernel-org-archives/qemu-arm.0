Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2346026wrq;
        Thu, 24 Oct 2019 06:22:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7e8QYcL6tdDlUo5ko15zFbaG5BCST8trfmyIaLx0UCflUnUB8LjMFa5SWmBzXsrdqOpbT
X-Received: by 2002:a05:6638:da:: with SMTP id w26mr12279237jao.58.1571923370326;
        Thu, 24 Oct 2019 06:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571923370; cv=none;
        d=google.com; s=arc-20160816;
        b=SoqcWTOQVeTWwLbf+Y6T2u+PF8H6/k6jWjJQaNXYlz2PeueeA0iUycb3FOuCJDd+Q1
         B41vl98mxoy/uQwVFb3Uu3Ut9MgwRjSW05Ubcw1URfL0qpoOtgTCPjdbbOcEBBqDsHEs
         vX2n8n3CAp/idsagPPLsexcSOqq5jEWsst+2X8sgCIv+pXoKemXMEBeZDU9w3kzfVzoZ
         YhNLw7emYij16G1MwxepLX7pOCJltsWaUH+qiX8vHGc+8Tz60pgZiiQDYvDtJJAaHpBk
         BAMPD5mXprrSteUrc+KL8LmM4pZ1ry4QGpavD+81NAQvXV4DLeUYqMtJLf7ib33I75Pv
         UFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=orDeG2HpFEm4uQ8OkwdIq1VcQnCs3GmS/UVoomI07oM=;
        b=EmLr2RBGli69WX/o0CthFIdjAVX4rWzceuCqGq38I+ExMtpmpbxJjXn5fIHhwrUBOj
         AlGNLj5/VZiEOdj8DUWIa4JBw/cYJ5f3tjQfTKS62chp9kq85/5m0x+MJmhvbVwpoPI4
         zoNuF2KduauuNiPlhEyQKpJcuuVVNxL4X/UzpvW7upr5R7X22orUqpMGwhkuSuOy1E4f
         Ee3lFENxCyrDyUtGCfDvy+TJg04oqB+smRnNSVH7UKjWOMLeR8Ei7001uJ4wzSs0EInh
         Lm95wTk9eC9sI2usxs74vlUXpQwHTJQno1xyx+yND7tUiikti8JohONccjxMZGUUl+/p
         nKCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 15si16332006ion.78.2019.10.24.06.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 06:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66328112D81
	for <alex.bennee@linaro.org>; Thu, 24 Oct 2019 13:22:48 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id g13so835107wme.0
        for <alex.bennee@linaro.org>; Thu, 24 Oct 2019 06:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=orDeG2HpFEm4uQ8OkwdIq1VcQnCs3GmS/UVoomI07oM=;
        b=B3EfZEDp4cEb/9LSFjA1gOYfOKK6DJs7BBWlPAc4+A0Z+Q5pw4OmPL31HxJm2i87t6
         axsGcQT+vU4E37ioHZ7bPdUH7vh8SCDwy+y0cbig2WFtZYuEGWqfO1KPtfvBy4cdbR3e
         tfupAYIcGrA+4wU+f7ic7Tga62/xQqe7PLkUZIpnnzgKu+yUva/+onHpIzWFXsuJxJ4I
         gKCd1e/yZZK2hNGS4PUZDTF4aK38qMbc+b3enVNDVjFvQRmKZy4VykFDiZ9rZyuuzzjY
         h1H7jb9WtWanjzfGTBFTdYVEjX9y8F2dCyJijSuWOFAIwKSjyZaY17nRS3/ENG7CHZCF
         KGXA==
X-Gm-Message-State: APjAAAVMGNSf7OLnnAR8f6VL1V+8ZlP/iK2F5OFV46nh+6uNIQjsfsSl
	HKBl/7jrsWzkXasLBT3fmGoClrbYLPdWpcBLqPyWce3NYVyzmduhVoX94NbiltZIU0O0tCHkOB+
	Xhvybgk2JB98iAKxy
X-Received: by 2002:a1c:2c4:: with SMTP id 187mr5274340wmc.78.1571923366850;
        Thu, 24 Oct 2019 06:22:46 -0700 (PDT)
X-Received: by 2002:a1c:2c4:: with SMTP id 187mr5274307wmc.78.1571923366536;
        Thu, 24 Oct 2019 06:22:46 -0700 (PDT)
Received: from [192.168.1.115] (129.red-83-57-174.dynamicip.rima-tde.net. [83.57.174.129])
        by smtp.gmail.com with ESMTPSA id b7sm10511469wrn.53.2019.10.24.06.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 06:22:45 -0700 (PDT)
Subject: Re: [PATCH v7 2/9] tests: arm: Introduce cpu feature tests
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Cc: m.mizuma@jp.fujitsu.com, beata.michalska@linaro.org,
 richard.henderson@linaro.org, armbru@redhat.com, eric.auger@redhat.com,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20191024121808.9612-1-drjones@redhat.com>
 <20191024121808.9612-3-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4717bef4-5952-7df0-7e9a-951ea140a42a@redhat.com>
Date: Thu, 24 Oct 2019 15:22:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024121808.9612-3-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: sYdP7S+PMOEF

On 10/24/19 2:18 PM, Andrew Jones wrote:
> Now that Arm CPUs have advertised features lets add tests to ensure
> we maintain their expected availability with and without KVM.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/Makefile.include   |   5 +-
>   tests/arm-cpu-features.c | 240 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 244 insertions(+), 1 deletion(-)
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
> index 000000000000..c59fcf409c89
> --- /dev/null
> +++ b/tests/arm-cpu-features.c
> @@ -0,0 +1,240 @@
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
> +    g_assert(!resp_has_props(_resp) ||                                 \
> +             !qdict_get(resp_get_props(_resp), feature));              \
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
> +    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +        assert_has_feature(qts, "host", "aarch64");
> +        assert_has_feature(qts, "host", "pmu");
> +
> +        assert_error(qts, "cortex-a15",
> +            "We cannot guarantee the CPU type 'cortex-a15' works "
> +            "with KVM on this host", NULL);
> +    } else {
> +        assert_has_not_feature(qts, "host", "aarch64");
> +        assert_has_not_feature(qts, "host", "pmu");

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

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
