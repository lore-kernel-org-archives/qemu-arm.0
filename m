Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp267808lfr;
        Fri, 16 Apr 2021 03:55:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6v218ck5OCGcFl7gAzutWLEhQg3P33D2olee5x/vh+CP5/z1Sq9XUzRTRhBeVqWoFsjvZ
X-Received: by 2002:a92:d48b:: with SMTP id p11mr5960567ilg.139.1618570529752;
        Fri, 16 Apr 2021 03:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618570529; cv=none;
        d=google.com; s=arc-20160816;
        b=jq4Dg8yDx6VYIA0n+wUbbHx3olGwwrQCIey5VX9WKm/glbpNTWUnuMyqKJHenGBjjE
         ttKaENjPJRmwSfarVeVjXRtMnimIRZ2PHjD0yxauNRcgSmfj9c8Wvq3xhY8P/YTUq1y+
         RQ7mzq6q87C/wA5MxUavStlYjEADxvIFzq1svlld+7iBUf3J+p3cwc43UmW0As7cdhfk
         Pf25NuNmFpm+NAxl0t5w9gqtC6khwV1KlWBF8PzJbFqrB35IIPdx19RgeJYgs/5gmqHZ
         PkjVYA8ly3LWjDKjbPTH0q/DBH7JzDNkMxoj4qR4hf1Pjt83Q/8FCtcecDJk0e4XsDsV
         nUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=4ly2d48as9h04yFVKGmJHx/FY8aLIjlppcJIhajVWok=;
        b=ICaxehBoF4A+ecpavd6M+o7weWo6+0ylH0z2t/wgJD0iqzl08DjlSZk6d1BCCF2LSj
         GT3BaLZBGXuZyiTesMeNPCx54mCy/Ym2OzcqE0zKp0Iz27fLkE/bwCF0ufTZ59iaBNbl
         HSKCuWjTRIF3bTAX10oamv8Si6dCjbPd+nIdE68HMOyz2FCfSZZsjMYQxhjmLZeDazWY
         rVX1V4kHA4bfLdEIjXcl+716DTnwatB0pg8NZ6MQn4bRcsnakaPh7fpmKcq9ide2yLK0
         RCAQCYVVjrvD+oiChNy6jtWTHfmQ43gLlbx5V0Dwmc7TlsvUO5y5StrqMgiETU3K2fCd
         vMJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si803084ilg.143.2021.04.16.03.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 03:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXM8H-0006fY-4s
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 06:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lXM86-0006dj-RV; Fri, 16 Apr 2021 06:55:18 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:57959
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lXM84-0004xK-CW; Fri, 16 Apr 2021 06:55:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 321291408C9;
 Fri, 16 Apr 2021 10:55:11 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 12:55:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002931298a4-c0c5-48d4-976d-6b6d69568788,
 138CDC1FF09234587CE5031F2EFAB81617CD6BEF) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 16 Apr 2021 12:55:09 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v4 09/12] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
Message-ID: <20210416125509.7c01030d@bahia.lan>
In-Reply-To: <20210415163304.4120052-10-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-10-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 9fc0252e-aa3f-4c1b-bf6f-e2e357ab8fd4
X-Ovh-Tracer-Id: 7858499875686881631
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Claudio
 Fontana <cfontana@suse.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?= " <berrange@redhat.com>, Cornelia
 Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0MudGdqXnJt

On Thu, 15 Apr 2021 18:33:01 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> We might have a s390x/ppc64 QEMU binary built without the KVM
> accelerator (configured with --disable-kvm).
> Checking for /dev/kvm accessibility isn't enough, also check for the
> accelerator in the binary.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

LGTM

Reviewed-by: Greg Kurz <groug@kaod.org>

> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  tests/qtest/migration-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3a711bb4929..c32a2aa30a2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1408,7 +1408,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "ppc64") &&
>          (access("/sys/module/kvm_hv", F_OK) ||
> -         access("/dev/kvm", R_OK | W_OK))) {
> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>          g_test_message("Skipping test: kvm_hv not available");
>          return g_test_run();
>      }
> @@ -1419,7 +1419,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "s390x")) {
>  #if defined(HOST_S390X)
> -        if (access("/dev/kvm", R_OK | W_OK)) {
> +        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
>              g_test_message("Skipping test: kvm not available");
>              return g_test_run();
>          }

