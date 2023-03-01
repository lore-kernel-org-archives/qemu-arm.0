Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6936675ejc;
        Wed, 1 Mar 2023 05:05:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+NHFblfDQWfkuax5IUB/srclmhTMvEJ7oyHJizdoNU7/BIUMH5QDCt8Ka122pIRfaT2/FJ
X-Received: by 2002:ac8:5b81:0:b0:3b8:6ca4:bb23 with SMTP id a1-20020ac85b81000000b003b86ca4bb23mr10931217qta.15.1677675900261;
        Wed, 01 Mar 2023 05:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677675900; cv=none;
        d=google.com; s=arc-20160816;
        b=Uoa/oCrjQfObbiRIBCs73MBy766UMFrw3R+APoDh4jfInoRYcmSCoHnST/8DDX57cG
         /NNLPAz/f31fdPs6PSvuRQkJJUNKz/f9u2pr85gZy72s3EuhlX0UGpinJJ00DPkNaXbU
         xPrI1zWPuzYA1cNP5fnzh9OwTh4u8neRua8k1/C+3mmNUpbO07Bab6HQqyW4yHNDfeJ2
         3zdTmUywsZ6yQnHAz6E5xX3FKIeCBYmBWAl4Ycd5Nj6aQEdplMSS/qtGOUq1RtVTuifH
         MPIM5sefh7vkSe2H3tNzCBGhy5FSurvDkKTn49hgAj2Bftae35hsyR+JJWq17l8rzdwq
         VHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hEr7S2tY3CSG53qLQG3ftobebPDE/si7g0Pdjw1Wlss=;
        b=LUlig+QJwWxXetGgKieWqUy4T5DCRR5Ld4wRb1mmX0IhIYzMmOCofo9Qn+QJs04ipv
         nzo8Gvatb6pM8N26onf1JiWvIzncUQVlZDzaT8KnIKcX1VwmFgmbRZFYl0k7Nu7n/Yqv
         NgVljy2Qt+cwVTzinzi9vG+tqPcN9z8Wtdfi6BG2pJArJ4HFKvxv6jhkkh1Ev0+9rr6k
         rtJ+Jz7od72yHNho2VxhggQ/gtCdFXnd83DUQUbxv6Nb18UX82Mq5it9lOwOazIGb8hN
         b4KFXhD9GzBJxyn7Klv5MxhosNXVk52JYr9jqQGTIZdq9QZscFC711KjQNv8QWEKYRTn
         DORw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dce91ocu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 19-20020ac85713000000b003bbd8bdb936si10720530qtw.794.2023.03.01.05.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:05:00 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dce91ocu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677675899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEr7S2tY3CSG53qLQG3ftobebPDE/si7g0Pdjw1Wlss=;
	b=dce91ocuc1taeSKot220DmUes6Drgm9ggZOHRh7eaAKmP2f8h92hBWQREBW9xsqlY84tEM
	6oICl36pk0/lDxPgDH1C/BENvthRU/pZsb2UEAlT6cdZB3c7kEooEdfwkmm6frQy92TDLr
	EXhNYtRJXJk9akFgLyigtdMS+5W48nk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-rHakem0hMsO7F-OL9VCT_w-1; Wed, 01 Mar 2023 08:04:58 -0500
X-MC-Unique: rHakem0hMsO7F-OL9VCT_w-1
Received: by mail-wm1-f69.google.com with SMTP id c7-20020a7bc847000000b003e00be23a70so8326709wml.2
        for <alex.bennee@linaro.org>; Wed, 01 Mar 2023 05:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEr7S2tY3CSG53qLQG3ftobebPDE/si7g0Pdjw1Wlss=;
        b=iqAmhGeKIoNPkc27TuoyE5KcTnT6Y0jIt9tOu9IlUrFHCcT0sktdZsDBI856B8zbmC
         CiMhF86vTwuWl9lGwCmuwhTaAhIiD0Wn0vSV7HozyQFRGsPKsqM0wLDvrSZXiJ7zA28d
         0oQZvhufVs7QXLL1OOg2HbbAyRvzgZ3HVpxQmctrGD7SqwKdFlB53CRn/Hqwn03PpRxO
         SztdQaZZ0gq8W4/AzkQtrbgf+wk8n4/8P5ucqG7C6vL7vD86eB8YlCUHiopb+nMaKpZC
         9rwfuClGPeMSFPIUbxlBcZdlwd3EkluLIMHBVChOkr1OuowOU+aVjIJuxZ2U/MkS/OiI
         rhEg==
X-Gm-Message-State: AO0yUKV3Ns1eLdrPXadTpIKMzrtz5Dy7pGioQbhd6IFOVCJLb1erPfHK
	H3DcCYmDzGzDzCJDdPB0OecZcZxRLWLolgWQMyQAXG5FWxq1p/0v9gwIG6xnwIGUt4KwcRYTbCV
	zFFHDna6BWPTPO7Lj
X-Received: by 2002:a05:600c:16c4:b0:3db:15b1:fb28 with SMTP id l4-20020a05600c16c400b003db15b1fb28mr5509751wmn.19.1677675897509;
        Wed, 01 Mar 2023 05:04:57 -0800 (PST)
X-Received: by 2002:a05:600c:16c4:b0:3db:15b1:fb28 with SMTP id l4-20020a05600c16c400b003db15b1fb28mr5509725wmn.19.1677675897231;
        Wed, 01 Mar 2023 05:04:57 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com. [80.187.122.219])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d4c47000000b002c5534db60bsm12497005wrt.71.2023.03.01.05.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:04:56 -0800 (PST)
Message-ID: <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com>
Date: Wed, 1 Mar 2023 14:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228192628.26140-10-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4AWMfWmqDWdI

On 28/02/2023 20.26, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Fix tests that crash or hang in the above scenario. Do not include any
> test cases if TCG and KVM are missing.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
...
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..45490f5931 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -17,6 +17,9 @@
>   #include "libqtest.h"
>   #include "libqos/libqos-spapr.h"
>   
> +static bool has_tcg;
> +static bool has_kvm;

Any special reason for putting these here instead of making them local 
variables in the main() function?

>   static const uint8_t bios_avr[] = {
>       0x88, 0xe0,             /* ldi r24, 0x08   */
>       0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
> @@ -285,6 +288,13 @@ int main(int argc, char *argv[])
>       const char *arch = qtest_get_arch();
>       int i;
>   
> +    has_tcg = qtest_has_accel("tcg");
> +    has_kvm = qtest_has_accel("kvm");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>       g_test_init(&argc, &argv, NULL);

Could you please put the new code below the g_test_init() ?
Just to avoid the problem that has been reported here:

  https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08331.html

  Thanks,
   Thomas


>       for (i = 0; tests[i].arch != NULL; i++) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 109bc8e7b1..a6e3ca9f7d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2460,11 +2460,16 @@ static bool kvm_dirty_ring_supported(void)
>   int main(int argc, char **argv)
>   {
>       const bool has_kvm = qtest_has_accel("kvm");
> +    const bool has_tcg = qtest_has_accel("tcg");
>       const bool has_uffd = ufd_version_check();
>       const char *arch = qtest_get_arch();
>       g_autoptr(GError) err = NULL;
>       int ret;
>   
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>       g_test_init(&argc, &argv, NULL);
>   
>       /*
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..05575f7687 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -130,6 +130,12 @@ int main(int argc, char *argv[])
>   {
>       int ret;
>       const char *arch = qtest_get_arch();
> +    bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm = qtest_has_accel("kvm");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
>   
>       ret = boot_sector_init(disk);
>       if(ret)
> diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
> index efba76e716..8045d3d706 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -164,6 +164,12 @@ static void vmgenid_query_monitor_test(void)
>   int main(int argc, char **argv)
>   {
>       int ret;
> +    bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm = qtest_has_accel("kvm");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
>   
>       ret = boot_sector_init(disk);
>       if (ret) {
