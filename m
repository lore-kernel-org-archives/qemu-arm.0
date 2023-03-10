Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2078905ejc;
        Fri, 10 Mar 2023 08:14:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/p3eRNIfgeDgw1lIyR3zoryyLFmNfNZukJhOiH0qCjG1wRgzQ96vQAF+a7rnwTjVckhNRj
X-Received: by 2002:a05:6214:29ef:b0:56b:fa99:7866 with SMTP id jv15-20020a05621429ef00b0056bfa997866mr41430330qvb.7.1678464865252;
        Fri, 10 Mar 2023 08:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678464865; cv=none;
        d=google.com; s=arc-20160816;
        b=Qjt6HosbxFuQRgKn+LNxKVtI+/VngfTE+LxmCEnXNuhjs07gW/IgTVv8x9vTysHJkz
         DK62k+YfNexXk1zloK5vU1Za3AjFftIwnBMC8VsYUwmTlWd4X7LdI0UKM5zcWdPbN8qO
         E5f/RjTHN5W7aLNx9nKhxiLDBqT5ye1ahNUBjnPTLMNF5LFVy0SI/ctuJMwDKQgsILOo
         +Mt5DqMWUu/+l+VbR3JRlqlEGWk4W/Kd8SYnZPLlbscGvm0x1mu+grn7AxY5YvCQYNpQ
         zMXg+9uLyhBFOFoblsIYUOclFFxycMJd7vSjUF8Sh3j7xmnaMAugl7eVzW8w6XNX6/2L
         tzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8wjXer+LGzrQtKLC2FHSt+WLkrNsb1e/YqYqYvDFJXw=;
        b=Wl92/tkat6CbiSgLG4QwEUrewNtu5Z5WbVlAix/9FFWHtJOzKHPasepjvmzESZJjra
         4ksRScB8zcylDn1v6h7VIZW2OgNgl5W9ClfPU02mPJs/zEnZO5Gg5vzQ0Mzftez6F8Uo
         5Z0j0CVdmQYRVniUGI3QMbzwWaVIw7HpPNBQIynRcme7weedxuanfpiAxpqjuW+xsLb2
         JLCg1KoGdPTFZQL4G2LQpFBQ0ot6eFZeQ9/AfseOaK8RRhwAdml5vSSZztz2J4c4dXYG
         EdHUJvyPUTPWND3pJJV6C2cgfbGlw4EDZ5+labyDcxkOzuEO4M22LSeUOyHW5SK/g+HM
         hZuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W0DlPsY0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i8-20020a0c9c88000000b0057e60499689si1974948qvf.208.2023.03.10.08.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 08:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W0DlPsY0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678464864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wjXer+LGzrQtKLC2FHSt+WLkrNsb1e/YqYqYvDFJXw=;
	b=W0DlPsY0blFNkElXP4gcecDWjy+KN+vQHHKhL67WDDH2FEuKqd4fY8mD6Y2MqzVVjYJb8T
	52wV0xTas+qEPUTFFyb22P114NmfAJvrMSBfo0/3U/I0Ib28oEeuzTwIu5BomFFZFtZlmJ
	jS2m4KsH2Mwl0uS1Hjyk7oWzfct4d38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-T_G36y3SPGqv4QsKA4sYSw-1; Fri, 10 Mar 2023 11:14:23 -0500
X-MC-Unique: T_G36y3SPGqv4QsKA4sYSw-1
Received: by mail-wr1-f69.google.com with SMTP id c30-20020adfa31e000000b002c59b266371so1149748wrb.6
        for <alex.bennee@linaro.org>; Fri, 10 Mar 2023 08:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wjXer+LGzrQtKLC2FHSt+WLkrNsb1e/YqYqYvDFJXw=;
        b=mC20DkpKLbeYHn0DhRMN4UbJl29LPHYGt53SO3sQV/fJa/iyVcAI8QqH9kFQ/cjW0v
         5VQDB2FuWwgr5u/E7oNheYYWMaaxS5LutzU3aG5LnP8PpX4I3Gq0kVVBWIH1hRlAPZAe
         IqQnYefSXDgFK2R9dmuwenipS8sgrT7dLh69oy95DnwwaA/70fgjB2K7eEALpoMysYX7
         bclRcFHW1HqqvF7al8BaJ0Eb1A/lpVs5RRAfCRg7Ql3UkcKcGoFBFLaTlARRnnXjzNNH
         5G8i+Z4/jUtwpDOGtI3Eu5RZSEcAy9R4cRn+/4cFUc2l6/CMQ8meF2+3Iz/UQJmL304d
         evtA==
X-Gm-Message-State: AO0yUKXr69zuKz+qTj1gMtS+852Sa8YCiN88KaDdL48oLGvPcnujOQgK
	SleevPaV+0LVKl4YJdsjNu2Cph5Yraxzphzy7Asmg0uA/mgH2TueoL+LaEkpN3pBL6FSSJ/Dhin
	g/GTjHQRd78JvizZO1NUxQMOZkH0=
X-Received: by 2002:a05:600c:b8a:b0:3eb:578d:ded3 with SMTP id fl10-20020a05600c0b8a00b003eb578dded3mr3196219wmb.35.1678464862315;
        Fri, 10 Mar 2023 08:14:22 -0800 (PST)
X-Received: by 2002:a05:600c:b8a:b0:3eb:578d:ded3 with SMTP id fl10-20020a05600c0b8a00b003eb578dded3mr3196188wmb.35.1678464861992;
        Fri, 10 Mar 2023 08:14:21 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.2.110] (p549d1c92.dip0.t-ipconnect.de. [84.157.28.146])
        by smtp.gmail.com with ESMTPSA id m5-20020adffe45000000b002c5801aa9b0sm185030wrs.40.2023.03.10.08.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 08:14:21 -0800 (PST)
Message-ID: <dc35fc70-c609-09db-15f1-e59933cb1afd@redhat.com>
Date: Fri, 10 Mar 2023 17:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
To: Fabiano Rosas <farosas@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
 <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com> <877cvoehxo.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <877cvoehxo.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: P5ZTaXl4XGcb

On 10/03/2023 16.37, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 10/03/2023 14.06, Fabiano Rosas wrote:
>>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>>
>>>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>>> host.
>>>>>
>>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>>
>>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>>> test cases if TCG and KVM are missing.
>>>>>
>>>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>>>> printed before other messages") to avoid TAP parsing errors.
>>>>>
>>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>>
>>>> I don't like it that we are hard-coding the list of accelerators
>>>> like this. Make a wrapper?
>>>>
>>>
>>> Are you thinking of some sort of "has_any_accel" wrapper?
>>
>> I think in the long run, we want something like what I described here:
>>
>> https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/
>>
> 
> Wont't that function be too generic? The choice of accelerator is quite
> specific to each individual test, some might not work with TCG, some
> might not work with HVF and so on. There is no link between build-time
> configuration and runtime test execution after all. We could always have
> a build without an accelerator and then try to run a test that uses that
> accelerator. And also have an accelerator present that the test does not
> support at all.
> 
> 
> For this particularly bizarre case of not having TCG nor KVM in the
> build I'm inclined to go with Michael's suggestion of checking it at
> build time and skipping all the hassle. This is what I'm preparing:
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 29a4efb4c2..e698cdcb60 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -27,6 +27,12 @@ if config_host.has_key('CONFIG_MODULES')
>     qtests_generic += [ 'modules-test' ]
>   endif
>   
> +# For x86_64, i386 and aarch64 it is possible to have only Xen as an
> +# accelerator. Some tests require either TCG or KVM, so make sure they
> +# are present before building those tests.
> +tcg_or_kvm_available = (config_all.has_key('CONFIG_TCG') or
> +                        config_all.has_key('CONFIG_KVM'))
> +
>   qtests_pci = \
>     (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
>     (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
> @@ -40,11 +46,12 @@ qtests_filter = \
>     (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
>   
>   qtests_i386 = \
> -  (slirp.found() ? ['pxe-test'] : []) + \
> +  (slirp.found() and tcg_or_kvm_available ? ['pxe-test'] : []) +                            \
> ---
> 
> What do you think?

It's likely ok as additional check for Xen-only builds, but we certainly 
cannot remove the runtime checks for KVM (it's perfectly fine to have KVM 
included during compilation - but unavailable during runtime (e.g. if the 
kernel module is not loaded).

  Thomas
