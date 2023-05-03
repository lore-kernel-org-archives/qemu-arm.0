Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2737648ejm;
        Wed, 3 May 2023 03:29:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7S5cYe8yYJWC4U36m5jEZppDp8Q58C8WN/MrMYIUrfYUZdxGiJ95Mh6iXdd7reDP3ncWH4
X-Received: by 2002:a17:907:6d87:b0:959:266b:dea8 with SMTP id sb7-20020a1709076d8700b00959266bdea8mr3194729ejc.2.1683109740263;
        Wed, 03 May 2023 03:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683109740; cv=none;
        d=google.com; s=arc-20160816;
        b=MF9J/pvjc2oUc5YqQu8+si7XeeNWfUMm3V3cSGGfqnyGXNTPhGChtjgLbC3QZ8b++i
         8LjkRvL8LqZfaDEsLQGNFaWb3iGnZzJii21VxRtr5xK3qPgavRdqF1vUXsEqvKIOR0j4
         cLza5v3Nz7pHUgfFzXpIJzDca65WCv4sVJtjUBr68kkbmr5pVfQwuln60/jSx2qrhXqZ
         lnqRO8JDczMpQ95dFbv9fgWCt3/4X9LDbTXCgrCEEvJSeT5MefzL782mWER6tdJCJqRz
         Sy0Ka+T2uA2RvK9j1XkfmNn6c9FLXKq4h/+Fs6+nXTalYV93gyjQ2/nebzy3Q+N4QQcz
         UicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=TnPEnJrLHD8ltr2au6DXyolN9++eGsBREQwaNEUt+/M=;
        b=AKHSa7OT3UKKxe70CblFyycZ4PdIrmZSg815tH6wLtGlf9qwkJOS++kUJFrfcbbasI
         b3RhK4LU4PLambcQXTvY7JXp2XqytgHlHyeYuiySZUJVqXhfZBQRUHqPSMMw6Rv1Pfpg
         1lOk0EHfvEpej8kUkrCub3eyxiO09A66ytxHBTjXCCLgwl5NaNnBqbqzSwthNG841Ww/
         iGtsW+Ple5jsPFPQEIlyL0lbqWGu2SmmdiYkGcg+h7aKUpwI24XfqF5lLMjl3UsnYJRZ
         zEY4PWmPRcwLemZMeNYR3BfWEcG9Qm56IoO2ZNIAn6FJSt8araoWkVoiw42bk5g7wYfd
         AXww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BqAH8L7t;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ga22-20020a1709070c1600b00960d3966977si12829296ejc.832.2023.05.03.03.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BqAH8L7t;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683109739;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnPEnJrLHD8ltr2au6DXyolN9++eGsBREQwaNEUt+/M=;
	b=BqAH8L7t+VE/HhkpH+JfocUzCkfxMs14U9Ppm3vCXK/aJMom1XwdElffJ2v5LLy8yLNJtW
	79bY4VsCLinBLS2D0JawhhJS0UwmO7Ujw4aTkO+/W/Vegfi7NnOtGqyYFeRFJUBFbbZ4lp
	cy6RZkD4gwE3s7/75A3SYuWgpNPdMEY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-9ABM4-OsPQSKuiD4ASWKDg-1; Wed, 03 May 2023 06:28:58 -0400
X-MC-Unique: 9ABM4-OsPQSKuiD4ASWKDg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f1745d08b5so17964895e9.1
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 03:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683109737; x=1685701737;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnPEnJrLHD8ltr2au6DXyolN9++eGsBREQwaNEUt+/M=;
        b=EsRzGYbBsZU0Go8y4DJGq5zUCDjgdOZlLZtyuXYzcaikETGo17tIdgCfF/Zj0SlV8d
         pjT5SP3H2r3dGb13OrBBiCe1bNGlg5VPOEKZg/tUxiE81hpIN0r1Gzvwc4l4TBvdPi9P
         3g5ahujFzxBHXx+FbNo6CnhkIcxFhjaziquNMRidrQKu0DhAPDHjCsGhYDxsB2nIHpx+
         CFwFY+tYMX0VjndhYjWOP2dPC5VlKymH+I8xLndbip3ccikD600LK8AwtByjKsVMh8HV
         0Pv/vfUA50mo2A//aRvWTSXclyyaPPu5WpeWXJ8Tp1xBaSHesMrUi//QhsZAKu8Be/h/
         kMgA==
X-Gm-Message-State: AC+VfDzzxmwO68NnAYkVDd21T3CQYrQHyf9L87oDOisN8V6A3tYexv9b
	6vikoPYd+dXtppBxOVS8xxkvhBXSyHjbu3w4tsjnSjPlSSXHZscm/HIo8Jw8hURU0WOVQqW9++D
	yunXmdEZQsXcJu2TCO3CqFpJC+AsA5oeUg1kWJO0zHHu7TqqB08RkDYgvOJ1ZIxW+ZKbbiyWaC7
	ZMP1PBrw==
X-Received: by 2002:a05:6000:124b:b0:306:31b7:abe4 with SMTP id j11-20020a056000124b00b0030631b7abe4mr6030904wrx.14.1683109736924;
        Wed, 03 May 2023 03:28:56 -0700 (PDT)
X-Received: by 2002:a05:6000:124b:b0:306:31b7:abe4 with SMTP id j11-20020a056000124b00b0030631b7abe4mr6030851wrx.14.1683109736581;
        Wed, 03 May 2023 03:28:56 -0700 (PDT)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net. [188.85.120.92])
        by smtp.gmail.com with ESMTPSA id e6-20020a5d4e86000000b003063d83a168sm2294491wru.26.2023.05.03.03.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:28:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Artyom
 Tarasenko <atar4qemu@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Helge Deller <deller@gmx.de>,  Xiaojuan
 Yang <yangxiaojuan@loongson.cn>,  Stefan Hajnoczi <stefanha@redhat.com>,
  Cleber Rosa <crosa@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  John
 Snow <jsnow@redhat.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Andrew Jeffery
 <andrew@aj.id.au>,  qemu-s390x@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Beraldo Leal <bleal@redhat.com>,  Max
 Filippov <jcmvbkbc@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  Radoslaw Biernacki <rad@semihalf.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  David Hildenbrand <david@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Song Gao <gaosong@loongson.cn>,  Joel
 Stanley <joel@jms.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 02/22] tests/docker: bump the xtensa base to debian:11-slim
In-Reply-To: <20230503091244.1450613-3-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:24 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
	<20230503091244.1450613-3-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 03 May 2023 12:28:55 +0200
Message-ID: <87cz3hso7s.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GA/hbrj3pRw/

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Stretch is going out of support so things like security updates will
> fail. As the toolchain itself is binary it hopefully won't mind the
> underlying OS being updated.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>
