Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4456961ejb;
        Mon, 6 Feb 2023 10:24:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/1s8WY+qaBD28CQm7z9C9r0ZjxwJvwk2IdltSYJphxH7DsJv1UXEMLHlMacsblpSFm3eBL
X-Received: by 2002:ac8:578c:0:b0:3b9:b668:6baa with SMTP id v12-20020ac8578c000000b003b9b6686baamr484089qta.19.1675707846261;
        Mon, 06 Feb 2023 10:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675707846; cv=none;
        d=google.com; s=arc-20160816;
        b=rYndyNiQMJ9qdUutdm0Qb3nxVBa4WwZ3yERj8UofFib3m+tBtrvbhglDVjpY1owuNH
         cso0tMWkdocv4esqpfFMJH/76pycGOoYScCoiJC4WTvnKOFnrnhRrORsnV1q3rMd85at
         Fx3Hmg5yzs9PJCUjxLfo2L3fRv3rK5kmRyYXVg/n0dhncww1r0pS0w+GCZ8yHzB0bshw
         p5KDMq6ma78R39GMcNCITl+UQ9Ecpf4Iz+ml8/iPfhw4qhTzRP8+L0uE+bm6ZLPDcYFa
         Lqi+983KhgKsb6c+wH7oDncc4OlEhlBuorf3c2NzC8glTMn5g632nrBhrlyfOZCC5rin
         CQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FWuHJM2vrIVPSRC7Cm3a4a5SQKoCxaLOmsMZq298YuY=;
        b=r/LhcuXRfj5kkHL7JOZjelds5RxJLWGgHcjuAE+7pXs+f3W1ebEioJOSqMTnQMu79e
         5/TiM+IfMh6H0F0p1Pxe0qA7Sx7aaeX2EeeKQAO1CQ6ZpbkaxHddm1yctq243iNm4pG5
         vcIZFIRc9OvqVY8CfacQqnV1fibxVdcOwj3xNjx02tPhSz/OB2TQ0avcEGODwq4uYVLw
         Tb/ZqZMHOx0hQlYuMQXT+UOAu8Ks8Wcj7t7CzuKCzhsoVE1SPrS23F5GIeJz/DAZuAJ2
         vZA9zR1dNvjmFfdnhEcWPtkjcsBatyHKSckBkiRITVBmJ+c5JSKAr1VoFwI9/P5T/fUC
         5edw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gpMsgXNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020ac87d41000000b003b68e9d252csi8272182qtb.585.2023.02.06.10.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 10:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gpMsgXNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP69V-0000gF-Ma; Mon, 06 Feb 2023 13:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP69R-0000f6-RM
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:23:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP69N-0000Di-Cg
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675707810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWuHJM2vrIVPSRC7Cm3a4a5SQKoCxaLOmsMZq298YuY=;
 b=gpMsgXNmHb3CL05dDjGi+Kd9MVGIrCB8QGGfadPVEawUFu4QAxBLaBo3z1JjgGHrkwpImH
 rddJaxi4ZdihUpKZm3+4EQfkw4xM2enHgx+jhN8lBL4+XbT79tqzJuvE0xJw/7Z4GjkalT
 eJUK/x7n3Yw0Fq6faNc+4W9cagZC0IU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-sgapDYzNO_SvL1eldTc_jQ-1; Mon, 06 Feb 2023 13:23:23 -0500
X-MC-Unique: sgapDYzNO_SvL1eldTc_jQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 s4-20020ac85284000000b003b849aa2cd6so6963522qtn.15
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 10:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWuHJM2vrIVPSRC7Cm3a4a5SQKoCxaLOmsMZq298YuY=;
 b=43QfmbTFSXopj4wjmc9WEaIC+TBvAXcJNw7vl1/eedSnyjtQsCvKQnhJrDLZXp5yLQ
 nUQfpscKL0pEc/oVAdk+/LE1lWPO+nN5jiAMOsBBDlVB1DvJjELMK0eNtb1a7FQYcxjf
 Sxz1ogRJJWAGzRJZFCHRk11Apm/yfqc/aWWAvRiC9Eiq3OmgpohrgGHYrG28Fbz1m01z
 aWgpYgPqintgyLd/MsPkOysFKuG9tZwn0LV4I5qTUZWu0QVYrX3KNH4w8cN+3+ygXblw
 39aAc6c1qA8kOWpXAu66HfR/1+uLcaiDAjeknHirJN8WnIsqBHosPgCUhBqxELD2CGLS
 95/Q==
X-Gm-Message-State: AO0yUKVlW4hYNvdjmmUS5MOkDbvRukzGcQHZ5sLS02J07GHZECJ6eMQ0
 BCtIewR6ra1b6iZV+mSVkmeTVgz0aH0A1EX9rtzCGXJFZ7PhGLKu95SlDlYvUCN+3HroKK6vdb5
 /GDoFqLpfC1o/
X-Received: by 2002:ac8:5cce:0:b0:3b9:a777:3d9a with SMTP id
 s14-20020ac85cce000000b003b9a7773d9amr365565qta.44.1675707801077; 
 Mon, 06 Feb 2023 10:23:21 -0800 (PST)
X-Received: by 2002:ac8:5cce:0:b0:3b9:a777:3d9a with SMTP id
 s14-20020ac85cce000000b003b9a7773d9amr365519qta.44.1675707800716; 
 Mon, 06 Feb 2023 10:23:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l9-20020ae9f009000000b007069fde14a6sm7323856qkg.25.2023.02.06.10.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:23:19 -0800 (PST)
Message-ID: <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
Date: Mon, 6 Feb 2023 19:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 3/3] qtests/arm: add some mte tests
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-4-cohuck@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230203134433.31513-4-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: eOC6fd5hOhFK

Hi,

On 2/3/23 14:44, Cornelia Huck wrote:
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Still as you need to respin I think adding a short commit msg wouldn't
hurt ;-) Add new cpu MTE feature tests with TCG+virt tag memory and
TCG-no tag memory (default) attempting to set cpu mte option on/off. No
real test for KVM because ../..
> ---
>  tests/qtest/arm-cpu-features.c | 75 ++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8691802950ca..c5dbf66e938a 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -22,6 +22,7 @@
>  
>  #define MACHINE     "-machine virt,gic-version=max -accel tcg "
>  #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_MTE "-machine virt,gic-version=max,mte=on -accel tcg "
>  #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                      "  'arguments': { 'type': 'full', "
>  #define QUERY_TAIL  "}}"
> @@ -156,6 +157,18 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>      g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
>  })
>  
> +#define resp_assert_feature_str(resp, feature, expected_value)         \
> +({                                                                     \
> +    QDict *_props;                                                     \
> +                                                                       \
> +    g_assert(_resp);                                                   \
> +    g_assert(resp_has_props(_resp));                                   \
> +    _props = resp_get_props(_resp);                                    \
> +    g_assert(qdict_get(_props, feature));                              \
> +    g_assert_cmpstr(qdict_get_try_str(_props, feature), ==,            \
> +                    expected_value);                                   \
> +})
> +
>  #define assert_feature(qts, cpu_type, feature, expected_value)         \
>  ({                                                                     \
>      QDict *_resp;                                                      \
> @@ -166,6 +179,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>      qobject_unref(_resp);                                              \
>  })
>  
> +#define assert_feature_str(qts, cpu_type, feature, expected_value)     \
> +({                                                                     \
> +    QDict *_resp;                                                      \
> +                                                                       \
> +    _resp = do_query_no_props(qts, cpu_type);                          \
> +    g_assert(_resp);                                                   \
> +    resp_assert_feature_str(_resp, feature, expected_value);           \
> +    qobject_unref(_resp);                                              \
> +})
> +
>  #define assert_set_feature(qts, cpu_type, feature, value)              \
>  ({                                                                     \
>      const char *_fmt = (value) ? "{ %s: true }" : "{ %s: false }";     \
> @@ -177,6 +200,17 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>      qobject_unref(_resp);                                              \
>  })
>  
Not really related to your series but those macros become increasingly
difficult to follow. Especially the feature param versus format that are
partly redundant look weird: "mte", "off", "{ 'mte': 'off' }

Starting adding comments may help the reading.
> +#define assert_set_feature_str(qts, cpu_type, feature, value, _fmt)    \
> +({                                                                     \
> +    const char *__fmt = _fmt;                                          \
> +    QDict *_resp;                                                      \
> +                                                                       \
> +    _resp = do_query(qts, cpu_type, __fmt, feature);                   \
> +    g_assert(_resp);                                                   \
> +    resp_assert_feature_str(_resp, feature, value);                    \
> +    qobject_unref(_resp);                                              \
> +})
> +
>  #define assert_has_feature_enabled(qts, cpu_type, feature)             \
>      assert_feature(qts, cpu_type, feature, true)
>  
> @@ -413,6 +447,24 @@ static void sve_tests_sve_off_kvm(const void *data)
>      qtest_quit(qts);
>  }
>  
> +static void mte_tests_tag_memory_on(const void *data)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init(MACHINE_MTE "-cpu max");
> +
> +    /*
> +     * With tag memory, "mte" should default to on, and explicitly specifying
> +     * either on or off should be fine.
> +     */
the above comment rather applies to assert_set_feature_str's, right?
> +    assert_has_feature(qts, "max", "mte");
> +
> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
> +    assert_set_feature_str(qts, "max", "mte", "on", "{ 'mte': 'on' }");
> +
> +    qtest_quit(qts);
> +}
> +
>  static void pauth_tests_default(QTestState *qts, const char *cpu_type)
>  {
>      assert_has_feature_enabled(qts, cpu_type, "pauth");
> @@ -425,6 +477,19 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
>                   "{ 'pauth': false, 'pauth-impdef': true }");
>  }
>  
> +static void mte_tests_default(QTestState *qts, const char *cpu_type)
> +{
> +    assert_has_feature(qts, cpu_type, "mte");
> +
> +    /*
> +     * Without tag memory, mte will be off under tcg.
> +     * Explicitly enabling it yields an error.
> +     */
> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
> +    assert_error(qts, cpu_type, "mte=on requires tag memory",
> +                 "{ 'mte': 'on' }");
Sorry in v4 I reported I preferred the pauth msg, clarifying now:

    assert_error(qts, cpu_type, "cannot enable pauth-impdef without pauth",
                 "{ 'pauth': false, 'pauth-impdef': true }");

Here would translate into cannot enable mte without tag memory.

> +}
> +
>  static void test_query_cpu_model_expansion(const void *data)
>  {
>      QTestState *qts;
> @@ -474,6 +539,7 @@ static void test_query_cpu_model_expansion(const void *data)
>  
>          sve_tests_default(qts, "max");
>          pauth_tests_default(qts, "max");
> +        mte_tests_default(qts, "max");
>  
>          /* Test that features that depend on KVM generate errors without. */
>          assert_error(qts, "max",
> @@ -517,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          assert_set_feature(qts, "host", "pmu", false);
>          assert_set_feature(qts, "host", "pmu", true);
>  
> +        /*
> +         * Unfortunately, there's no easy way to test whether this instance
> +         * of KVM supports MTE. So we can only assert that the feature
> +         * is present, but not whether it can be toggled.
> +         */
> +        assert_has_feature(qts, "host", "mte");
I know you replied in v4 but I am still confused:
What does
      (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
return on a MTE capable host and and on a non MTE capable host?

If I remember correctly qmp_query_cpu_model_expansion loops over the
advertised features and try to set them explicitly so if the host does
not support it this should fail and the result should be different from
the case where the host supports it (even if it is off by default)

Does assert_has_feature_enabled() returns false?

Thanks

Eric


> +
>          /*
>           * Some features would be enabled by default, but they're disabled
>           * because this instance of KVM doesn't support them. Test that the
> @@ -631,6 +704,8 @@ int main(int argc, char **argv)
>                              NULL, sve_tests_sve_off);
>          qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
>                              NULL, sve_tests_sve_off_kvm);
> +        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
> +                            NULL, mte_tests_tag_memory_on);
>      }
>  
>      return g_test_run();

