Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp375794njc;
        Wed, 7 Aug 2024 21:32:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQTaQDKb8s+vGUrU2eLyuvuKaemWCUfPSbd3cxUDLAQKiEJeDxlrgbP9YCbv4HUXla9nV7CuH7O7H2G1ecyfJUGvsPE6Hy
X-Google-Smtp-Source: AGHT+IGVYfgpnE3hRITYEKjIMfRYB4YVkDTu5uJcsM2RU28jXYwc/Z2hOVYyu006ZKCvD8X7kkQe
X-Received: by 2002:a05:620a:6202:b0:796:de79:f577 with SMTP id af79cd13be357-7a3826f356cmr68337885a.7.1723091560897;
        Wed, 07 Aug 2024 21:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723091560; cv=none;
        d=google.com; s=arc-20160816;
        b=ZuQxJ1SmJ2tDJhd0zndNu50IO7OzBy6Ra25batUg8Zr94KtGTvBxUN2nVcjzA8CLyW
         u5WbVmqKyGADfrr7wDLIDpVJ2KF5suy58NSuQR3FfFXFwQq3dcCVN6blAXH9Zqn4kVPr
         6Uzeast/GCFe1YPxibHlCRW1eBopP44vQHkY0WCP0w0+sHkqDafGIMqTCJ+fVKrZ/qiu
         FDAuRVlAlDD/MtgiF4vRARGFSzgOKFNNHbBbARPPQFnXXvkMmdH2sVTj60/JTjgxVDAE
         HcE+4vVvaZoypppM9NmPgGfJFx7u5+2zxoq3kx98WF6wcBnQnhIimnsigZjvC9rRyhsy
         PHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=THxiXrFg9fVJClNJH92HU5jwc7ph/Mhv2GNMPuRT5wk=;
        fh=t4Y28DVIqtV+MSBQpAeeUpuJxxHHgJPFCb51U2BCN/U=;
        b=hKgwq5xOSbwpHuwd5aBegpzJLXdkAFbw5z6E5QEnRIr+in0DFXkUyGNepUi/x/sVKr
         rbuCvFnz/1DugBj2jv46DWaorca8qmXvob2FJW+M40bwugKgEbwrL82M7vlQLjoob4f8
         ct+gTib6P0nMn/XNOo9OY4/47hPk7kfYEBu1Ncig17Q0qQeND+i1wiVh2YaAPHT9jGg2
         hGKeYNvEJHLz3WKFmWBwKLf6hzRQPQAKOAx48T+F5Mg5bChIjJoV9FOtkm5okS8t9/4+
         fDEs8fo4oFIxxbuAFh8WWTdk1Mw6SlfAnAygxC+o2iVsKNLvmzNxfnSFLU9na747nq5m
         P3WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XxWT8qg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a378874e33si317307985a.694.2024.08.07.21.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 21:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XxWT8qg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbup0-0001Vi-Sw; Thu, 08 Aug 2024 00:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbuoy-0001Tl-MU
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 00:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbuox-000524-80
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 00:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723091532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=THxiXrFg9fVJClNJH92HU5jwc7ph/Mhv2GNMPuRT5wk=;
 b=XxWT8qg9sHcrKWDAHakz//7pIGa+J1KZ8uobIjWuMKl2yzfgwS4D97WvHQQOL8habKLWcF
 i1yh2HElFY+C7v++qKTzMwwTrtJ/wOUo1ZewZg/y2+WHgsTmnvOMlwCcGHv8Ev4V0vTbqm
 +wLMUONkJVB9w8i9FA6P/HnF7ip33q0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-K5HLM5XtOliAQM01sTkM9g-1; Thu,
 08 Aug 2024 00:32:11 -0400
X-MC-Unique: K5HLM5XtOliAQM01sTkM9g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 12C8019560B6; Thu,  8 Aug 2024 04:32:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 87BC719560AA; Thu,  8 Aug 2024 04:32:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 57E5221E6692; Thu,  8 Aug 2024 06:32:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  qemu-devel@nongnu.org,
 Eric Blake
 <eblake@redhat.com>,  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
In-Reply-To: <CAFEAcA9emwsK07+itUzMxReOLG8gHaxNdDE8ymuwyuBfsoY2Pg@mail.gmail.com>
 (Peter Maydell's message of "Wed, 7 Aug 2024 17:17:01 +0100")
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
 <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
 <CAFEAcA9emwsK07+itUzMxReOLG8gHaxNdDE8ymuwyuBfsoY2Pg@mail.gmail.com>
Date: Thu, 08 Aug 2024 06:32:01 +0200
Message-ID: <87bk23skhq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XTNfZtH4Yoaf

Peter Maydell <peter.maydell@linaro.org> writes:

[...]

> The QAPI command which this code is implementing is
> also (a) target-specific and (b) unfortunately
> designed so that it doesn't get passed a particular
> CPU or particular device to query, it's just assumed
> to be a part of the whole simulation.

We can fix (b) if we care: add a suitable optional argument, default to
the sole GIC in the system, fail if there's more than one.  I assume we
have no machines with more than one now.

