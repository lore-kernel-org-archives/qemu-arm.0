Received: by 10.25.21.96 with SMTP id l93csp231679lfi;
        Tue, 14 Jun 2016 12:47:32 -0700 (PDT)
X-Received: by 10.55.212.133 with SMTP id s5mr20807464qks.85.1465933652247;
        Tue, 14 Jun 2016 12:47:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z188si19443253qka.194.2016.06.14.12.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 12:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCuJ9-0007Nw-NM
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 15:47:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCuJ6-0007NP-JP
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 15:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCuIz-0007ai-V3
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 15:47:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bCuIz-0007aU-MS; Tue, 14 Jun 2016 15:47:21 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0D918113A;
	Tue, 14 Jun 2016 19:47:20 +0000 (UTC)
Received: from localhost (vpn1-7-151.gru2.redhat.com [10.97.7.151])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EJlJJA000700; Tue, 14 Jun 2016 15:47:20 -0400
Date: Tue, 14 Jun 2016 16:47:18 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160614194718.GJ17952@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<1465492263-28472-5-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465492263-28472-5-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 Jun 2016 19:47:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] Handling errors caused by -global (was Re: [Qemu-devel]
 [PATCH v2 4/6] cpu: use CPUClass->parse_features() as convertor to global
 properties)
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yXAx3RfIpiTa

On Thu, Jun 09, 2016 at 07:11:01PM +0200, Igor Mammedov wrote:
[...]
> -static void cpu_common_parse_features(CPUState *cpu, char *features,
> +static void cpu_common_parse_features(const char *typename, char *features,
>                                        Error **errp)
>  {
>      char *featurestr; /* Single "key=value" string being parsed */
>      char *val;
> -    Error *err = NULL;
> +    static bool cpu_globals_initialized;
> +
> +    /* TODO: all callers of ->parse_features() need to be changed to
> +     * call it only once, so we can remove this check (or change it
> +     * to assert(!cpu_globals_initialized).
> +     * Current callers of ->parse_features() are:
> +     * - machvirt_init()
> +     * - cpu_generic_init()
> +     * - cpu_x86_create()
> +     */
> +    if (cpu_globals_initialized) {
> +        return;
> +    }
> +    cpu_globals_initialized = true;
>  
>      featurestr = features ? strtok(features, ",") : NULL;
>  
>      while (featurestr) {
>          val = strchr(featurestr, '=');
>          if (val) {
> +            GlobalProperty *prop = g_new0(typeof(*prop), 1);
>              *val = 0;
>              val++;
> -            object_property_parse(OBJECT(cpu), val, featurestr, &err);
> -            if (err) {
> -                error_propagate(errp, err);
> -                return;
> -            }
> +            prop->driver = typename;
> +            prop->property = g_strdup(featurestr);
> +            prop->value = g_strdup(val);
> +            qdev_prop_register_global(prop);

This allows the user to trigger an assert:

  $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
  qemu-system-x86_64: hw/core/qdev-properties.c:1087: qdev_prop_set_globals_for_type: Assertion `prop->user_provided' failed.
  Aborted (core dumped)

but even if we fix the assert by setting
prop->user_provided=true, we have a problem. Previous behavior
was:

  $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
  qemu-system-x86_64: Property '.INVALID' not found
  $ 

after this patch, and setting prop->user_provided=true, we have:

  $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
  qemu-system-x86_64: Warning: global qemu64-x86_64-cpu.INVALID=on ignored: Property '.INVALID' not found
  [QEMU keeps running]

QEMU needs to refuse to run if an invalid property is specified
on -cpu. It is an important mechanism to prevent VMs from running
if the user is requesting for a unsupported feature that requires
newer QEMU.

Any suggestions on how to fix that?

Maybe qdev_prop_set_globals() can collect errors in a list in
DeviceState, and we can check for them in code that creates
device objects (like cpu_generic_init(), qdev_device_add()), or
in the beginning of device_set_realized().

-- 
Eduardo
