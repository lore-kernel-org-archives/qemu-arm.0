Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2408284lfg;
        Mon, 1 Aug 2022 03:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfe2PXRcuEl8EZZe5QlqGSsXHgNnbbovbRCjjP2KZYugoH7ET/JAOkcPIOMRJcWS4kdHe8
X-Received: by 2002:a05:620a:2848:b0:6af:6c3f:7141 with SMTP id h8-20020a05620a284800b006af6c3f7141mr10933795qkp.548.1659350523836;
        Mon, 01 Aug 2022 03:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659350523; cv=none;
        d=google.com; s=arc-20160816;
        b=MzeUxKhGv+mnvjBfXvqzw0vf0BuUSshLL0X+j53gSX4vIqhe8Hoa7ol5jvM7fnFNiY
         mLGbQLXsLM/UDQXsCKXyE3xvpM3hPY8y/8eEvIqvbG7MO5eE69T8GSTmB3DTJOh6+FxT
         tOibKuPrloOJ5eRU4Q7YNKm4nVI1q+ldVecWfYC/dd63pVaibcKhTfOkp2LnakrlFZ1o
         V8Qayzf644gRBvT+UCwHixC8XLNV4fyJmPh2vizH4xAhTaS9GciKaRRE+dEQJLMR/2SA
         5JjlpoetBuFAZ/6yuymnXWu4kmaWF1ffMFH6fWn1R1oaGp4/2UQG1VUVveCPGwrEcnCp
         N8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:cc:from:references:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hMRGCraIgOer8Fq0tpAr3ja28zDWULG0LAVxGdRhgM8=;
        b=EprnC2zsMla5W7WpZdq4tpqH3NVQ5Wlf8yOaX8p+CQTbs9gFHaS8WMtqF+CI4TxL86
         +7OKerUE6PcCiV4KHkJHwSdTdGgYA/MNsF1a3KEdOEpndrTOdAWNFQn7GwA8e/wGFoL6
         4HKKHwq1w/W8Bqcwan1m7c3ChRl5Ptw1FW3hJhJsHwO8IVu8RmZysbI2pooFHEZw0Ffn
         JeCUfej35Nx2BxDz2BnUv75b2IdVEkeuQTjBKbUZK3oAxRIrMJC5AHTdC+USVOepeepN
         ZPzTGhfcWPamxVFeFahNX9bjBCwZVmse1x3cfjJAOkVXTC5GCARGREVvRT1ld7Yr8rRB
         jRGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=II+Szplw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a05620a288900b006b5f9b7ac84si6922139qkp.365.2022.08.01.03.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 03:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=II+Szplw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oISs7-0008AQ-5v
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 06:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oISrY-00086q-Pi
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 06:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oISrV-0005rI-Ll
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 06:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659350484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMRGCraIgOer8Fq0tpAr3ja28zDWULG0LAVxGdRhgM8=;
 b=II+SzplwIheaLmXV4xo5oU86JoaKYfBrQDTN979AkhJzx+ccTIalq2HMN2ws/FiKfKBnTV
 ThllaweucQriivXXd3ANwnYv9NbcMIbCl/eIPmTmX6O9BpNV70dFshF83sULjS0Nfmc+Q8
 i5156khQ+Quhn4iuwlTyahhCvxpmUcE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-OS3SLS-MO220GdzMITLqjQ-1; Mon, 01 Aug 2022 06:41:23 -0400
X-MC-Unique: OS3SLS-MO220GdzMITLqjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003a315c2c1c0so7929037wmb.7
 for <qemu-arm@nongnu.org>; Mon, 01 Aug 2022 03:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:from:cc:subject:in-reply-to
 :content-transfer-encoding;
 bh=hMRGCraIgOer8Fq0tpAr3ja28zDWULG0LAVxGdRhgM8=;
 b=MbtO3s6iZsb1l1WfbWlIwkdq2Tv/tIyp+2+zeXJnR2ojDFvHUAbg444XGXvhuzbbTm
 35DXmOmjWfQkJFxojuraBSvcQWJorejQsWx/BJl1unYdMTuen6QTBK71jyCT/7PGyrJ+
 cbdrjNDg2rnvrOAOd4Yx+aivIHO7g/ITJJhdN/nWK4WHKbFKDoDwmZwfgvDqQFbaSFT9
 a1NXSwp/qte1aTSERkvtXgDSUtFClvsP4ayXdamzk6zeI2E8mVn/Czcm4xh189zjDRHn
 kTgkbj1AmDvGsrp71j5n3cQvs0yu8gbYeD/hCztrxa1nWsY9b/Lkt9S0HVvgyGYeMwoY
 8jyw==
X-Gm-Message-State: ACgBeo1jga6vj3xkThC1IZP/raRf2ujagdAiu64PHOEsyweyT2xMxlpC
 1BHAdlcCeb2q6ykGZH81CkRd3pYWHw0R0eB89unsTlJG/dZnsB0nCfUIa5yyyZqKzcbx1obU1+p
 HzwWFlJsVThgA
X-Received: by 2002:a05:6000:4084:b0:21e:c694:80db with SMTP id
 da4-20020a056000408400b0021ec69480dbmr9223194wrb.681.1659350482322; 
 Mon, 01 Aug 2022 03:41:22 -0700 (PDT)
X-Received: by 2002:a05:6000:4084:b0:21e:c694:80db with SMTP id
 da4-20020a056000408400b0021ec69480dbmr9223173wrb.681.1659350482076; 
 Mon, 01 Aug 2022 03:41:22 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0020fcaba73bcsm11518373wrw.104.2022.08.01.03.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 03:41:21 -0700 (PDT)
Message-ID: <c4ad47a1-a946-0f4e-69a2-65a6cc679a6e@redhat.com>
Date: Mon, 1 Aug 2022 12:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
References: <20220720111926.107055-1-dgilbert@redhat.com>
 <20220720111926.107055-9-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
Subject: migration test fails for aarch64 target (was: Re: [PULL 08/30] tests:
 Add dirty page rate limit test)
In-Reply-To: <20220720111926.107055-9-dgilbert@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uYdj2AiS2iur

On 20/07/2022 13.19, Dr. David Alan Gilbert (git) wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Add dirty page rate limit test if kernel support dirty ring,
> 
> The following qmp commands are covered by this test case:
> "calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
> "cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> Acked-by: Peter Xu <peterx@redhat.com>
> Message-Id: <eed5b847a6ef0a9c02a36383dbdd7db367dd1e7e.1656177590.git.huangy81@chinatelecom.cn>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tests/qtest/migration-helpers.c |  22 +++
>   tests/qtest/migration-helpers.h |   2 +
>   tests/qtest/migration-test.c    | 256 ++++++++++++++++++++++++++++++++
>   3 files changed, 280 insertions(+)
[...]
> +static QTestState *dirtylimit_start_vm(void)
> +{
> +    QTestState *vm = NULL;
> +    g_autofree gchar *cmd = NULL;
> +    const char *arch = qtest_get_arch();
> +    g_autofree char *bootpath = NULL;
> +
> +    assert((strcmp(arch, "x86_64") == 0));

  Hi!

This assert triggers on my x86 laptop when I run "make check" there. More 
precisely, it triggers when qemu-system-aarch64 is getting tested:

$ QTEST_QEMU_BINARY=./qemu-system-aarch64 tests/qtest/migration-test
/aarch64/migration/bad_dest: OK
/aarch64/migration/fd_proto: OK
/aarch64/migration/validate_uuid: OK
/aarch64/migration/validate_uuid_error: OK
/aarch64/migration/validate_uuid_src_not_set: OK
/aarch64/migration/validate_uuid_dst_not_set: OK
/aarch64/migration/auto_converge: OK
/aarch64/migration/dirty_ring: OK
/aarch64/migration/vcpu_dirty_limit: migration-test: 
../../devel/qemu/tests/qtest/migration-test.c:2304: dirtylimit_start_vm: 
Assertion `(strcmp(arch, "x86_64") == 0)' failed.
Aborted (core dumped)

>   static bool kvm_dirty_ring_supported(void)
>   {
>   #if defined(__linux__) && defined(HOST_X86_64)
> @@ -2204,6 +2458,8 @@ int main(int argc, char **argv)
>       if (kvm_dirty_ring_supported()) {
>           qtest_add_func("/migration/dirty_ring",
>                          test_precopy_unix_dirty_ring);
> +        qtest_add_func("/migration/vcpu_dirty_limit",
> +                       test_vcpu_dirty_limit);
>       }

kvm_dirty_ring_supported() returns "true" if the KVM of the *host* is x86 
and has the dirty ring support, but it does *not* check the target 
architecture that is currently tested, so you also get here "true" for 
qemu-system-aarch64 being tested on a x86 host... Thus I guess 
kvm_dirty_ring_supported() needs also a check for the right target architecture?

  Thomas

