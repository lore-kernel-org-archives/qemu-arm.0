Received: by 10.28.4.212 with SMTP id 203csp2040788wme;
        Thu, 26 Apr 2018 04:45:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrNOhZiCLlL5qz+BPQOt7tdriLZWSUymSrvQeIWxWIWJ7eAh8ylP0spRgAUQzP1GuD7DdmJ
X-Received: by 10.55.26.134 with SMTP id l6mr4705962qkh.206.1524743157954;
        Thu, 26 Apr 2018 04:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524743157; cv=none;
        d=google.com; s=arc-20160816;
        b=kR6waKp0bnzs5WN/JPkF/fGpAIVALbOl1mbSJzv1T2v1Z8QW1alZ0mv59ZuFSNamAt
         noSRKrIL5E5Zndv8Z+HJrxktGmTwk34SkAgTAEnFGHIigzd2qAedskmntVtG2lXRMxXm
         LFEuWYkOrFYtoXg5FS/XRHi7qATCg+W1h/r2C5X8Ij+aXGU5+iTfr8pDHgws379tsCIO
         scdu4OdJcN8gA+z9AZct7KLm4RtLE7NDJNFywFi2cumtl1OSEstjAzswIC25TySUZKSs
         nvOUqHsmJyidpxLsegHUMQ2MmcTJrtAOO8UlirKN5wb4K1fC7Ng3WiQ3PmUd258abO2W
         kioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=w4j5xR7Hb+0FnUrc01g59j170Tf4prRW405fppIWUuk=;
        b=JZmXHl/JMekL1dH/feurpHc8Iyc/5JStmvRJHL1LiFJ0+q8rZ0HeN9cvGPwtKUn7yk
         uYN6uslt3WPzLk8diLTRpKn0+b+xQ/k1oNHzvK20Z4ubZaw2I1a1uTZNVoHdCdrPXem1
         Xf4h4sulqAuNcctu7Emyeeqw6bM/fw98dyTrmceEhF3JcQdS0WRxdBMj/VoJRG+3Ria2
         IwL+qNR8QhVgu/YZGQiJoc9TL5K85oMKaiAgHkPWioz+VBIqGgohc9KfwvTVCfgfHnEr
         oUMjynqKC10MOSEsBxZU3VRIEwy8KfTdlPcnwJItnVO+DU72cX8lRqQ15yWfHopybbw1
         3TYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e128si2911374qkd.356.2018.04.26.04.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 04:45:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBfLZ-0005JF-EI
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 07:45:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBfLP-0005Iy-Ru
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 07:45:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBfLK-0006e2-W7
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 07:45:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41920 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fBfLK-0006db-Q5; Thu, 26 Apr 2018 07:45:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F25B540704AE;
	Thu, 26 Apr 2018 11:45:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5B3E10EE6C8;
	Thu, 26 Apr 2018 11:45:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9E0071138645; Thu, 26 Apr 2018 13:45:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
Date: Thu, 26 Apr 2018 13:45:27 +0200
In-Reply-To: <1521452376-25099-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Mon, 19 Mar 2018 10:39:36 +0100")
Message-ID: <87bme62nu0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 26 Apr 2018 11:45:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 26 Apr 2018 11:45:33 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] tests/device-introspect:
 Test devices with all machines, not only with "none"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GvCaZBYMnIQ2

Thomas Huth <thuth@redhat.com> writes:

> Many device introspection crashes only happen if you are using a
> certain machine, e.g.:
>
> $ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> { 'execute': 'qmp_capabilities' }
> {"return": {}}
> { 'execute': 'device-list-properties',
>   'arguments': {'typename': 'macio-newworld'}}
> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
> Device 'serial0' is in use
> Aborted (core dumped)
>
> To be able to catch these problems, let's extend the device-introspect
> test to check the devices on all machine types. Since this is a rather
> slow operation, the test is only run in "SPEED=slow" mode.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  In case someone wants to help with creating some bug fix patches
>  during the QEMU hard freeze phase: This test can now be used to
>  trigger lots of introspection bugs that we were not aware of yet.
>  I think most of the bugs are due to wrong handling of instance_init
>  vs. realize functions.
>  For Example:
>  $ make check-qtest SPEED=slow
>   GTESTER check-qtest-aarch64
>  RAMBlock "integrator.flash" already registered, abort!
>  Broken pipe
>  GTester: last random seed: R02S8e52709605790d290d2c8261cefb8b0e
>  Unsupported NIC model: lan9118
>  Broken pipe
>  GTester: last random seed: R02S326d4ea43bfce860ebe2d554192540f7
>  qemu-system-aarch64: warning: nic lan9118.0 has no peer
>  Unsupported NIC model: smc91c111
>  Broken pipe
>  GTester: last random seed: R02Se9783b450806f350a14e757b175e3dc4
>  qemu-system-aarch64: missing SecureDigital device
>  Broken pipe
>  GTester: last random seed: R02S5c718b8f4c4fd48a358de8daafcf1b6f
>  qemu-system-aarch64: warning: nic lan9118.0 has no peer
>  Unexpected error in error_set_from_qdev_prop_error() at hw/core/qdev-properties.c:1095:
>  Property 'allwinner-emac.netdev' can't take value 'hub0port0', it's in use
>  Broken pipe
>  GTester: last random seed: R02S597848ddcfdc76a695a946a9d4e50146
>  qemu-system-aarch64: warning: nic ftgmac100.0 has no peer
>  GTester: last random seed: R02Seea0f0b769a2161fa53a50479fd68d84
>  qemu-system-aarch64: warning: nic imx.fec.0 has no peer
>  qemu-system-aarch64: missing SecureDigital device
>  Broken pipe
>  GTester: last random seed: R02S9c2d3e34427162e7a56aa4ac859f1a6b
>  Unsupported NIC model: virtio-net-pci
>  Broken pipe
>  GTester: last random seed: R02Sd61c0e9ed52d50a17c784213e5c6590c
>  Unsupported NIC model: mv88w8618
>  Broken pipe
>  GTester: last random seed: R02Sbfaecfe58dd643f2faca218e3051d464
>  qemu-system-aarch64: warning: nic mv88w8618_eth.0 has no peer
>  qemu-system-aarch64: missing SecureDigital device
>  Broken pipe
>  Unsupported NIC model: xgmac
>  Broken pipe
>  GTester: last random seed: R02Sc61e65e884e364652c3a0c4190023565
>  fsl,imx7: Only 2 CPUs are supported (4 requested)
>  Broken pipe
>  GTester: last random seed: R02S0cfda43bc17e3e052d5a994b2c96457b
>  etc.
>
>  tests/device-introspect-test.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/tests/device-introspect-test.c b/tests/device-introspect-test.c
> index b80058f..a9b9cf7 100644
> --- a/tests/device-introspect-test.c
> +++ b/tests/device-introspect-test.c
> @@ -105,6 +105,8 @@ static void test_one_device(const char *type)
>      QDict *resp;
>      char *help, *qom_tree;
>  
> +    g_debug("Testing device '%s'", type);
> +
>      resp = qmp("{'execute': 'device-list-properties',"
>                 " 'arguments': {'typename': %s}}",
>                 type);
> @@ -206,13 +208,13 @@ static void test_device_intro_abstract(void)
>      qtest_end();
>  }
>  
> -static void test_device_intro_concrete(void)
> +static void test_device_intro_concrete(gconstpointer args)

const void *, please, because that's what qtest_add_data_func() takes.

>  {
>      QList *types;
>      QListEntry *entry;
>      const char *type;
>  
> -    qtest_start(common_args);
> +    qtest_start((const char *)args);
>      types = device_type_list(false);
>  
>      QLIST_FOREACH_ENTRY(types, entry) {
> @@ -224,6 +226,7 @@ static void test_device_intro_concrete(void)
>  
>      QDECREF(types);
>      qtest_end();
> +    g_free((void *)args);
>  }
>  
>  static void test_abstract_interfaces(void)
> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>      qtest_end();
>  }
>  
> +static void add_machine_test_case(const char *mname)
> +{
> +    char *path, *args;
> +
> +    /* Ignore blacklisted machines */
> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
> +        return;
> +    }
> +
> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
> +    args = g_strdup_printf("-machine %s", mname);
> +    qtest_add_data_func(path, args, test_device_intro_concrete);

This runs test_device_intro_concrete() with "-machine M" for all machine
types M, in SPEED=slow mode.

> +    g_free(path);
> +
> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
> +    qtest_add_data_func(path, args, test_device_intro_concrete);

This runs test_device_intro_concrete() with "-nodefaults -machine M" for
all machine types M, in SPEED=slow mode.

Has "without -nodefaults" exposed additional bugs?

Please mention "with and without -nodefaults" in the commit message.

I'd try "with -nodefaults" before "without", because "with" is the
simpler test case.

> +    g_free(path);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      g_test_init(&argc, &argv, NULL);
> @@ -268,8 +291,12 @@ int main(int argc, char **argv)
>      qtest_add_func("device/introspect/list-fields", test_qom_list_fields);
>      qtest_add_func("device/introspect/none", test_device_intro_none);
>      qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
> -    qtest_add_func("device/introspect/concrete", test_device_intro_concrete);
>      qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
> +    qtest_add_data_func("device/introspect/concrete", g_strdup(common_args),
> +                        test_device_intro_concrete);

This runs test_device_intro_concrete() with "-nodefaults -machine
none".  Duplicate in SPEED=slow mode?

> +    if (g_test_slow()) {
> +        qtest_cb_for_every_machine(add_machine_test_case);
> +    }
>  
>      return g_test_run();
>  }
