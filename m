Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp253146lfn;
        Mon, 25 Oct 2021 07:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXbSxVXBu+OIpF3V19ynejHPuqoSgjPsJ5RdlOeShyF2opIZZrzFXGE/Jp+ukWodytUWQR
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr18317392qtc.266.1635170893296;
        Mon, 25 Oct 2021 07:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635170893; cv=none;
        d=google.com; s=arc-20160816;
        b=DV1u05RidG5Rdg6ZRuIzL+bm+UIWqzfGw0osB8m4v1TGPct8shDYP7Z1M4aaosF/E2
         o+btlxm9rINWuKa+Do27bsTvkt6zq2HJ3bHLjSuhF+yan/bzMcULUYsTb0tAaR6RCgQW
         UGVdPf9Qji0tI9lJ69SKxwnajKZA97tglLt3lgQWrMYDr1TL6c4fan+hLupwEIVIrLrc
         TAvATMEtVuI+OAqx5inex9o+PLZ6VGzkc+3p3jR4jqrwFCmMcDa/9pgWIpCrxd6mQXk9
         qLa6G2JE/5tBDyM1wicV0poDzgqnZIWBSjUIVsn7ifCncZuroV1zt8ny6f//mOhvcjrS
         zCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=KO+Plb/8NUfGvbclsrErOlSEb2MH4gIXxdqzH/ARO1o=;
        b=ACrRaa4smzEQTT/5eNd+jtP0nGn73ntDLW4LbLuoj3WUTFKFQU9+SLCYIsR8DUfxLn
         jBtmFHIbDuot6F3Akzn2mB1j0BKwrbvXyseondg97QnZgxGMXuchavEQQUbh5MAN0sry
         T+aS8IyyO+WguP9vRe+xC+BLLbu/XNxtYhDAPK4NgQWLa8Sx2+33NjfViLm2dXwpl499
         jGLX00yjAJHWyuiFwj+6wBGl9g7PBIIfST8zxuZbrb2UpxSqMnB0Vq8ZfYsJRKJg796Z
         ZVAL8mtXuoi8PWL/uYphGyBWfJw6WPdPc6l4HENR7jJqpcaKW9DfW0gH4pPAVQf7qh0s
         gtWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gwLVTgij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si10298650vsv.246.2021.10.25.07.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Oct 2021 07:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gwLVTgij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mf0e1-0005AA-U2
	for alex.bennee@linaro.org; Mon, 25 Oct 2021 10:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0d5-0003ev-JK
 for qemu-arm@nongnu.org; Mon, 25 Oct 2021 10:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0ct-0003B7-FK
 for qemu-arm@nongnu.org; Mon, 25 Oct 2021 10:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KO+Plb/8NUfGvbclsrErOlSEb2MH4gIXxdqzH/ARO1o=;
 b=gwLVTgijg3XHGOhRixZUxwhjcBzbK05mgkbUOoALP30w6UyfsS6Kk2Ska+hqP/Ps7fSdz3
 qK9zJgwflyf73F1OR1ufV+YJrIJQlN56OQXvuv9KXSYaEcHY6EDPsJobDdpOno6ie+WyME
 RfjBEQg/ELIztkCPxPNyQg/ELgwPthg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-zgVLrKU5N8KH-Z6tKPaLQw-1; Mon, 25 Oct 2021 10:06:53 -0400
X-MC-Unique: zgVLrKU5N8KH-Z6tKPaLQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f2-20020a5d50c2000000b00167f5c0a206so2683979wrt.12
 for <qemu-arm@nongnu.org>; Mon, 25 Oct 2021 07:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KO+Plb/8NUfGvbclsrErOlSEb2MH4gIXxdqzH/ARO1o=;
 b=fhCOsHFJrXWw9hLS8nAN/PmFzZkfqBV0Dq5bfxtlJisQM4jEzOy/2O5KrI2CJXzzb+
 fyEG3bUaCQaWibKSoPE7gjVjCOPvt9i8FC7m+yb30CBS5x4jA/D2EUpJbDEb10hNljis
 2t67nYjZYelTsMDAB5g+gIugw+tGg8BpmJy62WAosPeSbNh6CJ26pTaN1D/+mutcwwKR
 MAQ7BVAtqCP3FHu80I7DBMJ96Ql7U1EFXynOO4DKYf0tDuHTshNOfm+oS+ERhdFDxsBK
 F/oaSFaOT61QD80moKh+ESG34BLt3HeIn4piwf2iggBGjdj2wjchge29QuoodBMVvSqf
 cFTA==
X-Gm-Message-State: AOAM530XlZKPndcPUkHcFm0sJ/DsNyU3zWj3WWX71pVNKn0ihVAKLdkg
 fjICEcb10sPyG6ubNaYIr1tovjk8fnm9MMPj27JTdO26bkDrhKG/Xe5voxVnORP3K+eSZ+6N7W+
 BR1aWAvDg8mNv
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr31443516wmb.69.1635170811707; 
 Mon, 25 Oct 2021 07:06:51 -0700 (PDT)
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr31443460wmb.69.1635170811334; 
 Mon, 25 Oct 2021 07:06:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k17sm21186923wmj.0.2021.10.25.07.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:06:50 -0700 (PDT)
Message-ID: <6498c6ec-2b41-f10c-a993-c1d52bd9bf92@redhat.com>
Date: Mon, 25 Oct 2021 16:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH-for-5.2? 4/5] tests/acceptance: Only run tests tagged
 'gating-ci' on GitLab CI
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-5-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20201102144245.2134077-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: byP9NI9b9hp3

On 11/2/20 15:42, Philippe Mathieu-Daudé wrote:
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
>              $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>              "AVOCADO", "tests/acceptance")

self-NAck, this has to be added in acceptance_test_job_template
in .gitlab-ci.d/buildtest-template.yml, not in tests/Makefile.include.

