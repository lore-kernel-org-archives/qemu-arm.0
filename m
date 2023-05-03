Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2707661ejm;
        Wed, 3 May 2023 02:20:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Vb+FN+L1fCwF1pgaBWTgdxF6sZ4N5oO2uapZRJZe+JrV3V7meUX5Zo6A+afB5XldIzZrw
X-Received: by 2002:a17:907:72d6:b0:961:b589:d083 with SMTP id du22-20020a17090772d600b00961b589d083mr2250955ejc.47.1683105656193;
        Wed, 03 May 2023 02:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683105656; cv=none;
        d=google.com; s=arc-20160816;
        b=fod0dJEnW5fmZPaZsPm5s1LKfanfbVwC0rn/uvNTvls63rxe2zfIWA1dic/PMd4NkP
         42gzHzy0NgTZUc2ZEPYlFWV6uLDq00TuXqHD7Aj162j/5cCNEMByrr5SgPXSTSJctPeG
         qTp9HoZwhXWJI5HsIKaLqP2TcbgeNmmiWVAMziOrM4WQveI5IQacfh9ggHgGIanw6UOD
         0ZdeL4GDHSXAFys/3vT1JEdTKJCitw+1Wxp+5d8L+zmUm0qG182aJvv0dUIkPdyhriVy
         AILedrsYOCbVpH+dRO6KpxWejAE3XMzYzb2V94NRzPlW6xrVQp+Z1HbrR3qkM9Pj6b6+
         BQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=omQ4R2QX/2d2JFlSuLnjEbi0u/9zZgwflkKF/NW9+Nc=;
        b=VzAVIGbc+wcrEVRr860h2YvIJD44bTcrKGcg/im8ijIpv0JB111JAP1FSTd6BqTst5
         t7oZWVovVt93bX0XkOqKmYemoAWisNtNQ6uToXHqoGhpDWccKcUg5FHv51FB5Q6pGZGC
         n4R1jm9sRPPxsb49tWmemyGGAPpsO4rIbBJHrOx0B9RV/D3pXY3F5DoWsxHOoYzxH1c8
         skr5BzmlrqxK2fpLddkE75gkiq5+eiuYCXfcVI21GDLbayIkr53M3ac1f2yPm3jcGo9h
         XM8iHWCbSI/ddk77n5dwhUCONDH7r5FZjczrBnq1Gkl/pWoDVHUD9T88OUZv7OqYylP3
         PRMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CJb/fqIQ";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u13-20020a17090657cd00b009538cf01634si21638566ejr.975.2023.05.03.02.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CJb/fqIQ";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683105655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omQ4R2QX/2d2JFlSuLnjEbi0u/9zZgwflkKF/NW9+Nc=;
	b=CJb/fqIQqyV05Af4AD3Vj80y5jZHeDYqltAedAQW6WfAVN6QXMqb5Sg/BQPaEGo0idlvrV
	YA141MYm3vO+rZcGup/69HIcnG1lgf09X0a7fuYX3CaGPTbmo1vRQSgsf5HwULoWeHePMT
	ChFL09wFj0Y+ZE5Hpx0yM8Mvx/nvkjA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-ad4HFx8pMGmEk6lfRGwJ0g-1; Wed, 03 May 2023 05:20:54 -0400
X-MC-Unique: ad4HFx8pMGmEk6lfRGwJ0g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f250e9e090so15577685e9.0
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 02:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105653; x=1685697653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omQ4R2QX/2d2JFlSuLnjEbi0u/9zZgwflkKF/NW9+Nc=;
        b=GKfRwedkS3lDiRlgny6IpZ+W36Pm7cqzawc8DGWQD1oHPVCaXIzGywDKGuvwFnLbYM
         WwUf+YMOfT2PcVsawTp92i1Z2h4JyCPwIsoreDQvXWVfrLv5QswYwL6hAXc3FC4miOME
         aJC7Xcvhh+jsYvcEg6OGV9NICQN3PeqCWpBY89woTBMcezZMPSL4YbZm/efN8ApR8WPT
         zW+BPK/IWiuaWzmOi5T6VmHwwwL3BsBbcCpCPeVs7uons6sUXZQtlDmujujpryvZC/Xe
         xYwBhqsCmYh760F94W0NxwQ/g3y03d0d+8BFE+SwxUkrYz2omKf/VckisC1QxM25Xmh2
         Uemw==
X-Gm-Message-State: AC+VfDxZKS1CmN7VfUg4GWCVxFuPkSI7eVW/Rl+VMeJ2MoW1/c1kf/eq
	pB6P7J22RP3b7V6aMf2SytRNk89Wf52zxEY9bWc74+OLCiBZpCcG837F+Kt8/BRzkYAUx/X3Xy8
	PLhLVtYD7xBG/eiMci8AgurVF7U8iOqt7TdCT4xuiz1etDJiyXtDeOMqXBHsAVrVutaYm+A2+
X-Received: by 2002:a5d:610e:0:b0:306:2a1a:d265 with SMTP id v14-20020a5d610e000000b003062a1ad265mr7298754wrt.58.1683105653054;
        Wed, 03 May 2023 02:20:53 -0700 (PDT)
X-Received: by 2002:a5d:610e:0:b0:306:2a1a:d265 with SMTP id v14-20020a5d610e000000b003062a1ad265mr7298700wrt.58.1683105652680;
        Wed, 03 May 2023 02:20:52 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id p6-20020adfcc86000000b0030644bdefd8sm794189wrj.52.2023.05.03.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:20:52 -0700 (PDT)
Message-ID: <49cbd197-22f3-b0a4-62be-24f2b41475ab@redhat.com>
Date: Wed, 3 May 2023 11:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/22] tests/docker: bump the xtensa base to
 debian:11-slim
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
 <20230503091244.1450613-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +h9mOyeL0yxu

On 03/05/2023 11.12, Alex Bennée wrote:
> Stretch is going out of support so things like security updates will
> fail. As the toolchain itself is binary it hopefully won't mind the
> underlying OS being updated.

Let's hope there won't be any problems with dynamic libraries...

Reviewed-by: Thomas Huth <thuth@redhat.com>
