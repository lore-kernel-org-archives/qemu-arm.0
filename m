Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp524671lfq;
        Tue, 8 Sep 2020 04:42:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4A9GPSzdmXnF/W91St/Ow+FqCu1IKWTP+0Ull7Id0CW69UFMjEnNIA7GBLt2tjnkKxKt5
X-Received: by 2002:a25:1fd5:: with SMTP id f204mr34945477ybf.236.1599565344738;
        Tue, 08 Sep 2020 04:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599565344; cv=none;
        d=google.com; s=arc-20160816;
        b=j+GwL9AtZOdPZMwK/DtHZkXJxgdV+6+eXKNsZP0eYeLUbw4q5rQnKkYc6SZgvNc6e+
         G428HUyyFvukFk/5R5LUuButSILjysjwk9atovp0NSE5ruhaL9b7ItpKrrsHbgdwbbto
         T+E4sPyrkk/UmvEyBCcFSEMNaZxgGFZ6xYjk17qxH7iScHOCzf7kISszt0WPjcTq0F3g
         uV8lwXM1eNvBr0HWAtgc7CRp5DcWaD5lHRgwXiL8fgiNG5ScqmaMik2gO26/krcQ+v9b
         shvrAqZDNo87h3PpjQh29i/epWEo8qv53eH/gEYPxrkzdHqJF1JwO2At2b94+jFWOQma
         XBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1Z2mpZ4De4ZPR19fEUl7/NoUb0ZHeWI84J/EbXO4rIA=;
        b=aQ1ju2wVr3thV1d27rRzTufzYyjL8qfFuhKE9PUZ7dXGS+kpeWeadIJNbeUW6dcITB
         2Yp1bUbAtRO/CG2B0ygEnXB2zm8ZbeKyRg4tBVNzMuRq9TWh92W1JsBg6uEqDHEERECy
         Xb9C/MGTEhMqMHnhtxb4uzAVM2y6sGnuhTGOSJ43XqIoY/tO8X6Z6jr6HgA62a9QXZXH
         5D92uaKvvX6qx72Pvjly3b1wvhf/FcoHzeLcAsI3j8KSLhxGZDLBn+dTK0pJzm6JnQlQ
         BndwBjeGJU1dmG3Ypd5XrB7Lk5Peigd8XOl1xmymQH0cYqyLiYnO4ffvGbR+kcoA5piC
         a1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JOVyd7Um;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d36si20512009ybe.81.2020.09.08.04.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JOVyd7Um;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFc12-00084V-58
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 07:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFc0f-00084E-6S
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:42:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34118
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFc0d-0001my-C6
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599565318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Z2mpZ4De4ZPR19fEUl7/NoUb0ZHeWI84J/EbXO4rIA=;
 b=JOVyd7Umo+3qhg1g0Es69el3WLMpw5c4D/Qj/klvm6A1NESR21F/T3WtksR1oN+go71Jpw
 9A5v68nO3ehvYMVxy7kGFBRHlNz/u8w8st7gl8ho5Si3hGLoBCqnfQfQ5VG0PEJ9E6dLaX
 yN46rdthdSO0zx+J8cxRHKfrbjsYpfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-siLF8DSHNEunU1Hx3zSRbQ-1; Tue, 08 Sep 2020 07:41:55 -0400
X-MC-Unique: siLF8DSHNEunU1Hx3zSRbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9083801AAB;
 Tue,  8 Sep 2020 11:41:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB49A380;
 Tue,  8 Sep 2020 11:41:51 +0000 (UTC)
Date: Tue, 8 Sep 2020 13:41:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 12/12] target/arm: spe: Add corresponding doc and test.
Message-ID: <20200908114149.tdkns7qwwchsmnbi@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <f85b67a841ad86f461c7dc0c8f5f8b1e5d490da5.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <f85b67a841ad86f461c7dc0c8f5f8b1e5d490da5.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3lx6RD0YWFu7

On Tue, Sep 08, 2020 at 08:13:30AM +0000, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  docs/system/arm/cpu-features.rst | 20 ++++++++++++++++++++
>  target/arm/monitor.c             |  2 +-
>  tests/qtest/arm-cpu-features.c   |  9 +++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 2d5c06cd01..5b81b9a560 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -344,3 +344,23 @@ verbose command lines.  However, the recommended way to select vector
>  lengths is to explicitly enable each desired length.  Therefore only
>  example's (1), (4), and (6) exhibit recommended uses of the properties.
>  
> +SPE CPU Property
> +==================

Too many '='

> +
> +The SPE CPU property `spe` is used to enable or disable the SPE feature,
> +just as the `pmu` CPU property completely enables or disables the PMU.
> +
> +Currently, this property is only available with KVM mode, and is enabled
> +by default if KVM support it. When KVM is enabled, if the host does not
> +support SPE, then an error is generated when attempting to enable it.
> +
> +Following are 2 examples to use this property:
> +
> +  1) Disable SPE::
> +
> +     $ qemu-system-aarch64 -M virt,accel=kvm -cpu max,spe=off
> +
> +  2) Implicitly enable it with the `host` CPU type if host cpu
> +     support it::

if the host CPU supports it


Actually, I'm not sure we need to document this feature. We didn't bother
documenting pauth, since there wasn't anything special about it and
there's nothing special about this feature either.

> +
> +     $ qemu-system-aarch64 -M virt,accel=kvm -cpu host
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index ba6e01abd0..1b8f08988a 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -99,7 +99,7 @@ QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>   * then the order that considers those dependencies must be used.
>   */
>  static const char *cpu_model_advertised_features[] = {
> -    "aarch64", "pmu", "sve",
> +    "aarch64", "pmu", "spe", "sve",
>      "sve128", "sve256", "sve384", "sve512",
>      "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
>      "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 77b5e30a9c..4d393fb2e2 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -494,6 +494,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          bool kvm_supports_sve;
> +        bool kvm_supports_spe;
>          char max_name[8], name[8];
>          uint32_t max_vq, vq;
>          uint64_t vls;
> @@ -512,8 +513,10 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>              "with KVM on this host", NULL);
>  
>          assert_has_feature(qts, "host", "sve");
> +        assert_has_feature(qts, "host", "spe");
>          resp = do_query_no_props(qts, "host");
>          kvm_supports_sve = resp_get_feature(resp, "sve");
> +        kvm_supports_spe = resp_get_feature(resp, "spe");
>          vls = resp_get_sve_vls(resp);
>          qobject_unref(resp);
>  
> @@ -573,10 +576,16 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          } else {
>              g_assert(vls == 0);
>          }
> +
> +        if (kvm_supports_spe) {
> +                assert_set_feature(qts, "host", "spe", false);
> +                assert_set_feature(qts, "host", "spe", true);
> +        }
>      } else {
>          assert_has_not_feature(qts, "host", "aarch64");
>          assert_has_not_feature(qts, "host", "pmu");
>          assert_has_not_feature(qts, "host", "sve");
> +        assert_has_not_feature(qts, "host", "spe");
>      }
>  
>      qtest_quit(qts);
> -- 
> 2.17.1
>

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com> 

