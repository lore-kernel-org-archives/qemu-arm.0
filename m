Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2708220ejm;
        Wed, 3 May 2023 02:22:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5LC1e6I1O68kqn4RFdDX2lHAlopNsdMkL1CmLhS5KfsOtngi65c4+Jxd57BiesxPEDmpyq
X-Received: by 2002:a05:6214:5013:b0:61b:75e0:6a19 with SMTP id jo19-20020a056214501300b0061b75e06a19mr1410587qvb.14.1683105744387;
        Wed, 03 May 2023 02:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683105744; cv=none;
        d=google.com; s=arc-20160816;
        b=wcSblHlir3tdP1dBVAcMTE/ncOHWew2XrauO4C5dJ+eo7co0z8pfv08zkC04n0X39l
         TVzSwzrbdyCB8MhS++fyoWJaLn/41UIKGi6XSRjftd2Gu0aJrgb5Qs+TNpgc1Hv768Az
         5EzsPCa+mUGcCuW3fnUwEyf1sFJ+qeRoguBTd0+mUw67WbUV27lqxbnzprae6mPCjrTa
         RluMtQI9iKUJAneqiIQhS6RO9kWp2/ILE1UZN1bK8wx23V8n/cziMxlFuQfLcmbGiOTg
         fUhOkjGHgOCpTGZjLQXqObAAPzcS68NrsEUl5ZJ/+cB3+CbCeDByZ1utgzTSiaviODSZ
         q4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NqkgC3S1KDc2BY6sHeEgA68VO8be0MAPKfmv5U/1kJc=;
        b=EQMa2iK17nar4FY9VTWL6ZT4+zfbtQwAht7boyVJb4MrOcWHlXVdJqp9kjzITubh64
         FNl7mt4jkZ1uwUIOxD8Mv8dfD5J/qPWoZoqYt633sc6ISDbVWXDL+avjKFZKqQrmjlqS
         GJQqv2bns7UePqsp54khJ/lNs8ZIan5VgPw0LWLa4OPlSldIxRPXcq9NphegFyxIFJqD
         HktEtLghjtL97W7cdv7rExtTl6eUX4e0gIk656zRBYqHgoLXnXAWDmicnC5WlLyk03zA
         /AKlKeL0huvMme40KcBGwSTzRNY728lft8yf+oprPW3/S0A7ZlR2Wrm9s5TCCRWwAart
         DqIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FngYQIUO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q2-20020ad45742000000b0061b5a057137si2427920qvx.568.2023.05.03.02.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FngYQIUO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683105744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqkgC3S1KDc2BY6sHeEgA68VO8be0MAPKfmv5U/1kJc=;
	b=FngYQIUORcL7jYF0Ghq+oQfo/8X5mXqw9JIDlOVkL9Iiw2Vfj0jbxbx6hZaOp78SFUp8i4
	yTBekhcf5QHad0yE0Jx1tzj/4YXz6MBlOO3czDERK/OrAZcwbJneeqle6WLKAlL7Eub74U
	neCOplZBjDnDDu2uRIoOQoanksikZUg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-0P6YzkN0NlKlIStiTkmxBg-1; Wed, 03 May 2023 05:22:20 -0400
X-MC-Unique: 0P6YzkN0NlKlIStiTkmxBg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30634323dfeso789643f8f.3
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 02:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105739; x=1685697739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqkgC3S1KDc2BY6sHeEgA68VO8be0MAPKfmv5U/1kJc=;
        b=EZtPpbF0MDOG4iLmXGE4SMWVbGkdEvI2XkB9MOA6Kai42u1TsQt3hUQiSSE9a20SZu
         4j0DhlJWnyGU6I/CA/YtQaeGCsXgo3Ir7Kf63qZAGB63ofHe1GybYQr1kpSt/uoWjkZl
         qJhaAYUbM7UO64XiHmNE+mc3BoseiEsvv1GEoNxN5BsbI/wNkfSm0qXCxAfA/zjYeNIu
         fmKJVgMcNbP3N+2QlWrG7s04alJxZPy1gMl6z7T/NO7OomDZtagmh9XIVOw5oYqAsUnc
         og1odDq7mhwORT6J7DhkK0Duigne0CwY0uMIA31NKJxbrAcsveyA18HkfhfrAHtQTdIG
         jysw==
X-Gm-Message-State: AC+VfDzuu2Jtc1WXG0+CKcE4zalCYGB+vSVAwjpE1ytBB5lbbb8CVnHr
	2gyYPwlknfvXd3tP1+36eZMtpbiKEFt09lid73/Gu0gtKWG22dlBJNIj7XEcA/AzIyGIMMCLmMJ
	J+YWj7Wx7yDCVZ8EKrpW5ZV0asVztNzq6DTAGfLHlUL4lZPcB9TDMhVioju7dyMzbueFEHGWx
X-Received: by 2002:a5d:5956:0:b0:304:b1da:77d with SMTP id e22-20020a5d5956000000b00304b1da077dmr13732811wri.52.1683105739789;
        Wed, 03 May 2023 02:22:19 -0700 (PDT)
X-Received: by 2002:a5d:5956:0:b0:304:b1da:77d with SMTP id e22-20020a5d5956000000b00304b1da077dmr13732762wri.52.1683105739498;
        Wed, 03 May 2023 02:22:19 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id j14-20020adfea4e000000b002fc3d8c134bsm33386891wrn.74.2023.05.03.02.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:22:19 -0700 (PDT)
Message-ID: <ddafd03d-3109-2bc2-4f91-1d8e5b1fe6a5@redhat.com>
Date: Wed, 3 May 2023 11:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/22] scripts/ci: add gitlab-runner to kvm group
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: k3an918ao+vo

On 03/05/2023 11.12, Alex Bennée wrote:
> One of the main reasons to have custom runners it so we can run KVM
> tests. Enable the "kvm" additional group so we can access the feature
> on the kernel.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   scripts/ci/setup/gitlab-runner.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
> index 1a1b270ff2..7bdafab511 100644
> --- a/scripts/ci/setup/gitlab-runner.yml
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -26,6 +26,7 @@
>         user:
>           user: gitlab-runner
>           group: gitlab-runner
> +        groups: kvm
>           comment: GitLab Runner
>           home: /home/gitlab-runner
>           shell: /bin/bash

Reviewed-by: Thomas Huth <thuth@redhat.com>
