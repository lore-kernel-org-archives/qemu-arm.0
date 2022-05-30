Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2818329lfh;
        Mon, 30 May 2022 07:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaGry8EzOdIlhzfgSkAuLiH7HUMr3Cb/hICf/yjWkVdXLyiuPY6Ja+aCfezzTWzZ52oTIL
X-Received: by 2002:a05:620a:190e:b0:6a6:2de8:8eba with SMTP id bj14-20020a05620a190e00b006a62de88ebamr3814844qkb.627.1653921709562;
        Mon, 30 May 2022 07:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653921709; cv=none;
        d=google.com; s=arc-20160816;
        b=wLyTp4Uc9GGgaexH/E+NwXjg6dN/XF8PuxgIgYCbT7eIRZj9rq4kAKYj+G/ZnfMM4+
         x+XQWNfnoqx6U7AfpsmNJ6t9dx4D50J7b+UoptAI847J4yxI94PLsT3rt0cOaOhQEDuS
         33qyGgPXibSJWydzmQh2h3knlcjod+Fl65NpkQbcmXzsrOLNiOH0xx0mRmCPV4/aBc39
         2yJcnJBaVCRQ2cgLD+Oo2FWbqBRX6s2f0Qi7vKmNI250ORNYJrmloo5yGCGAbx00f79B
         aIVfeJzf0ezr8ApDPkbr4ITjQFO7AwfHP2NszD1N+OkRN8Loz3EqmSqgQ97yNrGq/SRS
         8GMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=cxzJ0Q0Pgy8D7hAm6K1TWOjdF0JrXg7wW1lby0AGORQ=;
        b=KLu4Z7ilJQJn3Sr9nozY4m6SI8zpCdzNDbe24jlgzxAZXi1BOyFeUFqTNcX6fX8Sih
         q3Ui05DiEBtjw+rnYBTIDwZjtRYVbNPWR2SGXFJfwsXwF8ysgA58DOwy0LiM96JzZow2
         7i9AjVotyhaII9vQ0owXjt4FoCyCmkDwuszdzLlrZO7uetQ6QnqAMKBe7fLM5wAgTsAb
         W2SLZ7K0ui0g5ZTgJgBNgMIHIhXU7xSFjwL9sbc+3941fLujrCETOleAYsvT7oaSl6KE
         XCFzIoX5sruM3OWFZIsQfBPcJfnTw7hU7ZYy7hY2Hhnap4GhWVUrPwI1TlDvMX6HE5HW
         tXrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h1DnHT3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a049200b002f91696bb92si8270088qtx.705.2022.05.30.07.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 07:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h1DnHT3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvgab-0005b2-3u
	for alex.bennee@linaro.org; Mon, 30 May 2022 10:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvgaN-0005aD-Sx
 for qemu-arm@nongnu.org; Mon, 30 May 2022 10:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvgaK-0002C8-1n
 for qemu-arm@nongnu.org; Mon, 30 May 2022 10:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653921690;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxzJ0Q0Pgy8D7hAm6K1TWOjdF0JrXg7wW1lby0AGORQ=;
 b=h1DnHT3h60tiENwmv7UZtzUrH7rOOhK43OTn/k/ifBnNmrdCy+LRYe4tU+NaNs23chyKJr
 6QZdHLDuXbLRp3T6PkOHjEK/ALtqH4c6pa87/gw1Z0FZfhsq9qE2yG2S3CHPQDAmXvqa1s
 D+Oswx1PMQdLYnlJEmWNAcl6uJDQV9Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-NDrAnxveNfuQAF_XkHROaw-1; Mon, 30 May 2022 10:41:29 -0400
X-MC-Unique: NDrAnxveNfuQAF_XkHROaw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so9860048wmb.3
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 07:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxzJ0Q0Pgy8D7hAm6K1TWOjdF0JrXg7wW1lby0AGORQ=;
 b=z5nurJ9X77FfGFP5AWfzxU8gsRuh2PCDWp6tXf7RVE4bU1E1vCogu8n9VowJDNcHzn
 9CPXmpgrtFNWz0pasOumjbpBFBYfDts4zzqvnVzgex/JkIvG0y7itdaxFwU86KMwYxzM
 EVJHTMFCs/nHXhfrRQnY8mYx5EtoEkoWW7VzRqXEwevq6VKQAj3nLRDl3XQtOZX2eEoS
 DSqAYqKN1+byM/qWdJtfYLN6fnakAXwxso4vQxZxcZBjvmUwHx5jmmA3GrSGAdPgEiGi
 zpfDLQcqaNYY/uOt+M5+8ZfAUlBf2qwYJ5OSOGVUIpyWZAKIyCY6Cbo1acSx+HgM/N8l
 PPKQ==
X-Gm-Message-State: AOAM530CNS/nBnHjThZisepXhAVy8FkW0XxQc/PstpG0FnixuPEyeNsD
 jflk8NVOyHoFrEgBChjv0wn4mpz3HsmOovon55Hh3xNpIDSZaWrJZHArp/W7Gz2YUbgIOiKYisJ
 BNHwpTl39hz70
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr45591981wrr.142.1653921688665; 
 Mon, 30 May 2022 07:41:28 -0700 (PDT)
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr45591924wrr.142.1653921688366; 
 Mon, 30 May 2022 07:41:28 -0700 (PDT)
Received: from localhost (static-88-175-6-89.ipcom.comunitel.net.
 [89.6.175.88]) by smtp.gmail.com with ESMTPSA id
 r2-20020a7bc082000000b0039744664af7sm10615552wmh.1.2022.05.30.07.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 07:41:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,  Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha
 <ani@anisinha.ca>,  John Snow <jsnow@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Peter Maydell <peter.maydell@linaro.org>,  =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Andrew Jeffery <andrew@aj.id.au>,  Joel Stanley
 <joel@jms.id.au>,  Dmitry Fleytman <dmitry.fleytman@gmail.com>,  Hannes
 Reinecke <hare@suse.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Bin
 Meng <bin.meng@windriver.com>,  Su Hang <suhang16@mails.ucas.ac.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Coiby Xu
 <Coiby.Xu@gmail.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,  Tyrone Ting
 <kfting@nuvoton.com>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Markus Armbruster <armbru@redhat.com>,  Zhang Chen
 <chen.zhang@intel.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  Amit Shah <amit@kernel.org>,  Vikram
 Garhwal <fnu.vikram@xilinx.com>,  Francisco Iglesias
 <francisco.iglesias@xilinx.com>,  Michael Roth <michael.roth@amd.com>,
 qemu-block@nongnu.org (open list:IDE),  qemu-arm@nongnu.org (open
 list:ARM TCG CPUs),  qemu-ppc@nongnu.org (open list:sPAPR (pseries))
Subject: Re: [PATCH v2 05/26] tests: move libqtest.h back under qtest/
In-Reply-To: <20220426092715.3931705-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 26 Apr 2022 13:26:54 +0400")
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-6-marcandre.lureau@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 30 May 2022 16:41:27 +0200
Message-ID: <87h757qe08.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X67SdJSfzaAB

marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since commit a2ce7dbd917 ("meson: convert tests/qtest to meson"),
> libqtest.h is under libqos/ directory, while libqtest.c is still in
> qtest/. Move back to its original location to avoid mixing with libqos/.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

