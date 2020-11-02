Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3997139lfa;
        Mon, 2 Nov 2020 06:59:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxAXhFPMABf1IJrfiP7U/8oEleTHFKTG+A6JZHuX6A64rsyQWy6FEhMqPf5PthhHpm2gJj
X-Received: by 2002:a37:6745:: with SMTP id b66mr14121331qkc.221.1604329178923;
        Mon, 02 Nov 2020 06:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604329178; cv=none;
        d=google.com; s=arc-20160816;
        b=tcI3OwKTFZXxPdgeB79eKf1S666Yibz1Qwd88PtMG7Xgn/nmPVCzG3Nir+VTPHymnp
         F48uIF+u4+sU8dhM7ecdf6BcCu8JaHrJq/nH0DCo3fSV6o/XiiJvWnGPEM/UM/jgRYnb
         PNDq3D2mA9Qb3fkGoCQ3WLMhoQCcQcmudSGM7ZhfG1S0KIOEOfHbm+Qz+BaYBiWtLheA
         GkIv95peto6UOZNxhbVo2x5RMOsx+nISJ4pZZLUYoY9W/Utrb4IdeRS639Kuz7VSYYDn
         /ovVCQoZYuC+lBJx1NE3FHed6xPn+1P2N7MbA5plbhPzg/JwO6/jrb5hHl11gGKVnRiY
         Tggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XdmDUDB2KsVatqCFQs3MMXSY2ZPPqVfNhlc61MSh75o=;
        b=fgVUgL+F64a0yPl/Z77sN6d7N9fCOsnKESSNtH2hD6uLae5dQGgK8YMZ2T988g5Zdu
         edE+jMrdMK7j9tmXWfKzbs6njOz2kEfy3uLSrTxoW4z/KkprD1sCHdvOVRnUk2Dtj7gF
         DMWylc6N95J8HCZ0c7CRquecs/uwLjPUn8LBss4KRB8/aJ5ccSzfhAJd2VROyRXv98dM
         St/e4njVGFIlz1M0/Mmn7AW1JCS+AOcxwxrq40ZAbbDzxpmdoinVILpkNV7ZoxjJINnw
         oYCi2k42AdkpYOoU6TaAHZvqt9PSWJn1cx50EkE0/PkFCx86tL4Hxn2dRT1WZK/i0W/s
         CHLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V9Jswmln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si8780385qtr.198.2020.11.02.06.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 06:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V9Jswmln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZbJ4-0000JQ-9S
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 09:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZbIs-0000IV-AS
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:59:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZbIl-0002VN-Tg
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604329158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdmDUDB2KsVatqCFQs3MMXSY2ZPPqVfNhlc61MSh75o=;
 b=V9JswmlnGaigefWjuK3X2OxnPIPUR61N2uCDwfpOoCOrYgiFJe834BkAcrFQLI999FtddO
 9s0OszjZufATy/Sdykh0GxyZQKdIfH8fDigexS+cCMa+7R41Uu+1GQhjkvm5b6M6yY9FV4
 63ipSzbHcE0LGt6pbRNiY2EGyGYS32w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-DQI_alWHNxeWUZGK5NQsqg-1; Mon, 02 Nov 2020 09:59:16 -0500
X-MC-Unique: DQI_alWHNxeWUZGK5NQsqg-1
Received: by mail-wr1-f69.google.com with SMTP id t11so6546223wrv.10
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 06:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XdmDUDB2KsVatqCFQs3MMXSY2ZPPqVfNhlc61MSh75o=;
 b=FpY7QdmALU/AHILwoTx2ju1EP1N7vYUx4kOvxAD+yGeUlL4d9WMjOqD43l+a2duam0
 sti2UdUhbaJDDe/MkBccQ/4qYB4jstlkAy4bFvnP0KGRpOuihU9opSahnpecOhgdfXfq
 M7eO+Up7HFtoIUU2KIph5MMV9qOIjrVgemeK/86b+Z+zl6YW/wt5OTfUZN7dKkhiNXcB
 dpedEYZUyvmzyTOGi3N+nE4lLZ/shNTm/kfbJmRqFc19rP8NGFKUdLzibL1E8pUGFVpy
 ZuBeHY/BqhdIyAubrDVY2pGr1+s0lqWG5So4Ib9zsd+pzfxmAeCGxOXfO6TfzQj48CX9
 BcjA==
X-Gm-Message-State: AOAM530HhxJnIusjK7Ssgijntzo+2f1NbTMOCnkaXE0qVV0VREhWPOht
 Le+PUdhAxCMYf498asJqWb9VmTc/1v3TCS/oINoP7mKR3bGLP3Gds/29G4S0oTZNxm4iDOKFvee
 ITYE1/DrDY63T
X-Received: by 2002:a5d:420d:: with SMTP id n13mr20677190wrq.196.1604329155271; 
 Mon, 02 Nov 2020 06:59:15 -0800 (PST)
X-Received: by 2002:a5d:420d:: with SMTP id n13mr20677152wrq.196.1604329155073; 
 Mon, 02 Nov 2020 06:59:15 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id v6sm22402553wrb.53.2020.11.02.06.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 06:59:14 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2? 4/5] tests/acceptance: Only run tests tagged
 'gating-ci' on GitLab CI
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-5-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f40e30a8-7be3-3f02-352a-9e5f60446d25@redhat.com>
Date: Mon, 2 Nov 2020 15:59:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102144245.2134077-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6RP5b0xryQne

On 11/2/20 3:42 PM, Philippe Mathieu-Daudé wrote:
> To avoid breaking our CI each time a test is added, switch from the
> "run all but disable some" to "only run the tagged tests on CI".
> This way we can add a test to the repository, and promote it to
> 'gating-ci' once it is proven stable enough.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> 
> TODO: where to add documentation?
> 
> - docs/devel/testing.rst (too big, split?)
> - tests/acceptance/README.rst
> 
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 3a0524ce740..f39ba760c17 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -126,7 +126,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>              $(TESTS_VENV_DIR)/bin/python -m avocado \
>              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>              --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
> -            $(AVOCADO_TAGS) \
> +            $(AVOCADO_TAGS) -t gating-ci \

This doesn't work as expected, since we have:

AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter
%-softmmu,$(TARGET_DIRS)))

And avocado '-t' works as logical OR, not logical AND.

OTOH it seems this variable predate the auto-skip feature
(when a binary is not present).

So I'll test this instead, which is simpler:

-- >8 --
@@ -90,7 +90,7 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
-AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter
%-softmmu,$(TARGET_DIRS)))
+AVOCADO_TAGS=-t gating-ci

 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
        $(call quiet-command, \
---

