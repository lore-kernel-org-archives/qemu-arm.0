Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp524601lfr;
        Thu, 15 Apr 2021 06:23:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIW4Ymrmpu2LOL/NsriURaX/+waOtF2Ofk/gv9yHGjq7cU4UFs5OW8CL86Lj7naoRg7SUg
X-Received: by 2002:a6b:5104:: with SMTP id f4mr2679979iob.12.1618493033759;
        Thu, 15 Apr 2021 06:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618493033; cv=none;
        d=google.com; s=arc-20160816;
        b=OzEXQa5a8wXBZkcb5Ww/1S4PcIJ02F8mn4DiOfsely6t1AlxUg3YAF7Eat0DxoRJSF
         W5WkCZEtF21fs1T6zTs86+7/QTHZli7GuejRV0WN9Gjo4IY3uQXWr82cqBfiZgeNi9uV
         e3Kqe8chCWuoUcp1vBTF42LmNJ0wrZ+cI4ihqDe3St6p+6MF/yDmUu+37gdpG/HHi/SR
         FZdaTmb8HQMqly+bQ8HvIVfDjkqry0IVtcZCHHag06nT/RPewfmrvnx4di8aLm78ebHh
         DCxn+OKSO3wio/6GZI7BxSzBfEKSoRNUmTGntJ0aincYJLI5fwx98r85RYdVjFKwcrva
         HGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=nBvF13PakHko2OrOw6dpY76Z1vVkBiOvr975wpcCkPo=;
        b=TJsbGEUdcRJwPZbp9K97+uTK6+TfNjAL0UL2rjEmX0EVAvL6ZKR5O4TgIcJBc8R9Lj
         3XIRyMaxnk8aJOxt5j4reRafPkMOiN3gG2avNy1x/DdCfh3pj0mElR60LI9krwu2KOdR
         RLmKdZ79ozUhubOQW4LTa0yys9kJjA5A1t7uVpEhCG/PTc4+yDM3VZLrVM1sg9bqy4Ip
         zJSeMBFzxI+2Gn4OOejFoWxQjbSDE8JPqjhvD5bpOotkdCQff9pr94U7HIQ+WHthLnhj
         /EeAI9IeY1rv6EzOUKCHU16Gi+dtQmWG6NS/NiFdnPbQCxRYMnPc+waPO8pliXlR9Xnk
         tQ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SsL5VR7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si2648455ile.154.2021.04.15.06.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 06:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SsL5VR7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX1yL-0004dm-2e
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 09:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX1y8-0004cz-AT
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 09:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX1y2-00056N-V7
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 09:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618493013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nBvF13PakHko2OrOw6dpY76Z1vVkBiOvr975wpcCkPo=;
 b=SsL5VR7cvImz1SbMQWZ/DP5YMYNzQvC5aupz+4YSkZ/rPDk9NorccU/HLqwCM87ROuziti
 mzPX/vRohjTeP8ExNeZIgUjryepSUOAdWBKk8Rbqje1IG5EQ9IVJVHeLIggQ42vGSDm0PN
 +QziSMGTzEh0wZspH4DOenzgCLZaE3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-T-wMZ9nKOciKDrDzAgbBkQ-1; Thu, 15 Apr 2021 09:23:26 -0400
X-MC-Unique: T-wMZ9nKOciKDrDzAgbBkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02245A686D;
 Thu, 15 Apr 2021 13:23:26 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EA15196AC;
 Thu, 15 Apr 2021 13:23:20 +0000 (UTC)
Date: Thu, 15 Apr 2021 15:23:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 7/6] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Message-ID: <20210415132317.rcnlq2iptbryeivs@kamzik.brq.redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
 <20210415125737.4064646-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415125737.4064646-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zpO9xjDPH++B

On Thu, Apr 15, 2021 at 02:57:37PM +0200, Philippe Mathieu-Daudé wrote:
> Use the recently added generic qtest_has_accel() method to
> check if KVM is available.
> 
> Suggested-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/arm-cpu-features.c | 25 +------------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb85..7f4b2521277 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -26,21 +26,6 @@
>                      "  'arguments': { 'type': 'full', "
>  #define QUERY_TAIL  "}}"
>  
> -static bool kvm_enabled(QTestState *qts)
> -{
> -    QDict *resp, *qdict;
> -    bool enabled;
> -
> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
> -    g_assert(qdict_haskey(resp, "return"));
> -    qdict = qdict_get_qdict(resp, "return");
> -    g_assert(qdict_haskey(qdict, "enabled"));
> -    enabled = qdict_get_bool(qdict, "enabled");
> -    qobject_unref(resp);
> -
> -    return enabled;
> -}
> -
>  static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>  {
>      return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
> @@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>  
>      qts = qtest_init(MACHINE_KVM "-cpu max");
>  
> -    /*
> -     * These tests target the 'host' CPU type, so KVM must be enabled.
> -     */
> -    if (!kvm_enabled(qts)) {
> -        qtest_quit(qts);
> -        return;
> -    }
> -
>      /* Enabling and disabling kvm-no-adjvtime should always work. */
>      assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>      assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>       * order avoid attempting to run an AArch32 QEMU with KVM on
>       * AArch64 hosts. That won't work and isn't easy to detect.
>       */
> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {

With this new guard in main(), we should be able to drop the tcg fallback
in MACHINE_KVM. But, to do that, we also need to guard the call to
sve_tests_sve_off_kvm().

>          qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                              NULL, test_query_cpu_model_expansion_kvm);
>      }
> -- 
> 2.26.3
> 

And, shouldn't we also guard all the other tests, which require tcg, with
qtest_has_accel("tcg")?

Thanks,
drew

