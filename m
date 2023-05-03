Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2706604ejm;
        Wed, 3 May 2023 02:18:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5cpuRUuRvBcZRdmjV2wCbZNxr13ifGCHcWofRLpB5fv/Wj9s5ggjfGgLICZmsioFFqYqrk
X-Received: by 2002:ac8:5a46:0:b0:3f0:a5dc:7c40 with SMTP id o6-20020ac85a46000000b003f0a5dc7c40mr30518957qta.45.1683105501699;
        Wed, 03 May 2023 02:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683105501; cv=none;
        d=google.com; s=arc-20160816;
        b=FiKUOQEsSq45j4FTKIJcb2cK6thHu/rzf9EvC3UKbh+4Mb8Fz49NsQyIjyYLQnQQKu
         vWCsGrAACV6KYWHRW/9bmJ6z9A2/IyhEhYZaPgrD2I7PEjOPXGXa5UvqjAYIxv58eYKt
         +eoQd6BE7T3XiT4tm30Pwc7Gg8l1ghqPwh6LJ0PDmsCgzQe3xUhiBolBjbxfaUNR6ppc
         vE10WGRZV4gl676ckf9ancbuURmpknxK4xR9/p+XKqK8m4o+qyADlGNMf11R9u4SXYH5
         PAAsRbK3qWXcw4uw8NRs6vD3ve2UPFXhsukW6aRb/PNMcf1eX4LIHZ5Pn18RXPDToT7g
         tcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JIjDyuhTWku71Kk+hAMJGF/L0dw8BvkhgAvVF7z8FvA=;
        b=r2df6US0lApBo5NxdIWkSW/4btwVB3hHpNZuSz8LwlwPYbNJzm2YasoYEjWgVK1zRo
         +mzDldPT1/Y2CGe2X1P8iXfnsL64z5aTgndlFaTZGUtqjXPHZ6Tuu0cJfome2/sQNBMk
         POdwHs3FyFJtf8L7yHSVJlLuSuiIard7D56gWIn5/vhDGBKNUAPpDyH2vU04P+qY1nxC
         XsQSFbgHMBi3eOD3xcCZfEe8mXuZ0O3UfxfpPcDSmjOAUn+jZJp18W7TA7RSox4AshAv
         uqKKUJXMB8ziyxkWnpKouXERuaJRXH2pEGjh+aaS+CFkTaCQNl+4A4YnAy65AnSc6Bcn
         vZKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bgt+OqXH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y18-20020a05622a165200b003e4ebdeabcasi19062532qtj.191.2023.05.03.02.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:18:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bgt+OqXH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683105501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIjDyuhTWku71Kk+hAMJGF/L0dw8BvkhgAvVF7z8FvA=;
	b=Bgt+OqXHW+Q78SftKi9qmnD6Pv9pUfSkbcG1/y+HHcjEgN6j5KqMjutJL9HAETWQTlOdRl
	fgO/62hVa8yNbW4dcu2WRv0QVuhudp6YPhq+HiXaCeThPQHHk2YlMgC6nYiP6Mm98fHCt/
	8LPxem7oVfGGEZ29FkBNrTq/frF5jfE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-YZkDirQxNDuZxmkGoZvSBg-1; Wed, 03 May 2023 05:18:20 -0400
X-MC-Unique: YZkDirQxNDuZxmkGoZvSBg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f18c2b2110so15378385e9.3
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 02:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105499; x=1685697499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIjDyuhTWku71Kk+hAMJGF/L0dw8BvkhgAvVF7z8FvA=;
        b=gD4fjGDNtQAalepZhyDzBxncIHhJcyt4qAMUGpwnK7G1Z5wtWzI3Gs1NZBO+bB32KJ
         Ih3Swqy+wdYAxDAnUZrqPJEnvAU0cLvklgY4OFgpSr5ZDc0bRBfrBKMXhg3KCF5y/3on
         DiBMNfexLmxhGLoLdk20abXs1c4x7qLQ83Z6jWQjiVfRJzdDjSTn9/rkWU+7ixazAxXA
         OKQcgb10V1GNMuzdc7RetrHWn/3vnzW2PLLPaiTasxQ+mkMbSHy5QtKn0PSlcTi77Ano
         5VTTDrebmn+apbS3bmZjl22Jk1d30hYaK5dO4gKeOFxhLMPtLY3CkF2EAReYLtiSQdxR
         22VA==
X-Gm-Message-State: AC+VfDwvsoPPmkm2Ronf9+ZOyZx+GX/zGGC3E9vdIgVHYOIYHyCfghGX
	HzVaFuvcw37LqyGTbWwZmRyG3KpmPr2Qekdz0Q9X9wYEHRreZmIj9PVGqei9qH9I+AooGVS13Jy
	3rqOSvI0qIOOs2RW8b/exZbPZ6JKmcSRcuL2gCfUBiM0Yrvxn/zgS8x7SWCKNsDf12JYHR1sO
X-Received: by 2002:a1c:cc13:0:b0:3f3:468c:a783 with SMTP id h19-20020a1ccc13000000b003f3468ca783mr3385237wmb.8.1683105499203;
        Wed, 03 May 2023 02:18:19 -0700 (PDT)
X-Received: by 2002:a1c:cc13:0:b0:3f3:468c:a783 with SMTP id h19-20020a1ccc13000000b003f3468ca783mr3385178wmb.8.1683105498811;
        Wed, 03 May 2023 02:18:18 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id o19-20020a1c7513000000b003f31cb7a203sm1289347wmc.14.2023.05.03.02.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:18:18 -0700 (PDT)
Message-ID: <93477153-dc6e-4e37-5ff4-f771551b5ac9@redhat.com>
Date: Wed, 3 May 2023 11:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/22] gitlab/cirrus: reduce scope of the FreeBSD testing
 matrix
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VOZejQQd55M3

On 03/05/2023 11.12, Alex Bennée wrote:
> While the Cirrus build machines are quite beefy it looks like we are
> still hitting timeouts. Lets reduce the testing matrix like we do for
> the other BSDs to see if this brings us under the line. This is
> however a pretty restricted set and I'm sure there are stalls
> happening on FreeBSD which should be addresses.

My fix/workaround for the hanging FreeBSD job has been merged yesterday:

  https://gitlab.com/qemu-project/qemu/-/commit/01013d2c10a07bb49d

It seems like the test now finishes again in 23 minutes:

  https://cirrus-ci.com/task/5409701572116480

... so I hope you can drop this patch here now from your queue.

  Thomas
