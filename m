Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2038242ejc;
        Fri, 10 Mar 2023 07:37:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+W3i9bBYCVapTV3Hh0y896wK2mWlno4EnbEiWFRNp19qKSDaHNNTJTXH4DGg+jYpMABg7U
X-Received: by 2002:a05:600c:4751:b0:3ea:f73e:9d8a with SMTP id w17-20020a05600c475100b003eaf73e9d8amr3012126wmo.30.1678462647694;
        Fri, 10 Mar 2023 07:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678462647; cv=none;
        d=google.com; s=arc-20160816;
        b=NvElmw8dCxnrKOY/L3rIYVzRv3n6O1DhGUgBoYNvRMuyWPp5nwaLIr87ySuvJpvty8
         x0tQ7nmwUXT/fYoFu3em8dDHHfCXy8lBtHu1moqWWp+hdZNFwPNxBMJa/PY/Cgsd6saF
         VR6sT5VmSa4UmSalQrm2feMJ/EOktHQ6QYIWYFOBn+DLcD+UgBApHpeg1XGfdHZVvcqN
         lNWee+EySD1IvgA0BHhPGRI2kv/jRfl5PWAasdDVZaXhNODHS6ed2YhV26JBf+W/aWM6
         AAgleGZ99kJaM+h4xKn/5Z6BjmtW7GO2oAE6L5TvzTtgP4h7uRfgXlTVHLHTsxIyRuOl
         7T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=o1T0P574/azf2sOaHLEPXGLVbh9LW5dl78gDeUUIh6w=;
        b=yG4WiVcyFiNfDfPvWucJORnrPDV2DGlG9CGZBGsT2zbrLloeJ46zcyfLbuZTt81DCp
         fXPCbJDHASc0iV1D+mwSg78SklqH5GbVDBrdSKKUXUTmqeI+SkINGsK4omNXmb8+s0yR
         usxZVl1ivPKsi55Oh9ZlRwsGNI7X7Lxt93LPvlDJAsKZZBkdSNtzGvsAJLaeMEiiksTh
         TW+2b7rU4jgsiG7Zxk9o4Ii/arGsSf8xHJuPK6ca+Z439qayREe1yu0Jhpqbj9zLz/yE
         BCxEsNpw6bCxcuwSjeNyAKEH89msRYhpbJpSmhgT4nLCkuVPwQCALlaF1+96Qr375yxR
         x+9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=i8r9BdTc;
       dkim=neutral (no key) header.i=@suse.de header.b="b/cwbdPa";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id l14-20020a05600c4f0e00b003e22e245972si231734wmq.4.2023.03.10.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=i8r9BdTc;
       dkim=neutral (no key) header.i=@suse.de header.b="b/cwbdPa";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 092221FD7C;
	Fri, 10 Mar 2023 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678462647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o1T0P574/azf2sOaHLEPXGLVbh9LW5dl78gDeUUIh6w=;
	b=i8r9BdTcpVaH4HNQRvCsHHLyxzFGUuRbIM8WqaDKRzHBMUQ+v9avRlxXSotcM2aey5BY1N
	sQwIHZSqzlr9kzJqQX62ZoNl7o52QQ49k5QZCSAIyhlt4nQ1t2Sl06b9Scvhj1LP0OQV2H
	dak+BPaZ1gR5TPsebXSOwpZ2gC2vSGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678462647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o1T0P574/azf2sOaHLEPXGLVbh9LW5dl78gDeUUIh6w=;
	b=b/cwbdPaTI8a9brBuI8/J681s0DxvSjaGXPU1aAqzufWMrUiI7epFwYpq0cqFZ8tjCuDdR
	oB0tvN+k9Et879CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B1C2134F7;
	Fri, 10 Mar 2023 15:37:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wD5eCrZOC2RNCQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 15:37:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
 <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com>
Date: Fri, 10 Mar 2023 12:37:23 -0300
Message-ID: <877cvoehxo.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: uE6j2pFVIgrj

Thomas Huth <thuth@redhat.com> writes:

> On 10/03/2023 14.06, Fabiano Rosas wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> 
>>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>> host.
>>>>
>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>
>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>> test cases if TCG and KVM are missing.
>>>>
>>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>>> printed before other messages") to avoid TAP parsing errors.
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>
>>> I don't like it that we are hard-coding the list of accelerators
>>> like this. Make a wrapper?
>>>
>> 
>> Are you thinking of some sort of "has_any_accel" wrapper?
>
> I think in the long run, we want something like what I described here:
>
> https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/
>

Wont't that function be too generic? The choice of accelerator is quite
specific to each individual test, some might not work with TCG, some
might not work with HVF and so on. There is no link between build-time
configuration and runtime test execution after all. We could always have
a build without an accelerator and then try to run a test that uses that
accelerator. And also have an accelerator present that the test does not
support at all.


For this particularly bizarre case of not having TCG nor KVM in the
build I'm inclined to go with Michael's suggestion of checking it at
build time and skipping all the hassle. This is what I'm preparing:

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 29a4efb4c2..e698cdcb60 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -27,6 +27,12 @@ if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
 endif
 
+# For x86_64, i386 and aarch64 it is possible to have only Xen as an
+# accelerator. Some tests require either TCG or KVM, so make sure they
+# are present before building those tests.
+tcg_or_kvm_available = (config_all.has_key('CONFIG_TCG') or
+                        config_all.has_key('CONFIG_KVM'))
+
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
@@ -40,11 +46,12 @@ qtests_filter = \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
 
 qtests_i386 = \
-  (slirp.found() ? ['pxe-test'] : []) + \
+  (slirp.found() and tcg_or_kvm_available ? ['pxe-test'] : []) +                            \
---

What do you think?
