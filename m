Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp703237ejb;
        Sun, 29 Jan 2023 20:48:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/sGHUoc4IiWXcH0BgPp6ZlPRLOjx8tHOLoFZTgOAktzT7K58nKAQcCWFBZ12L1mNU31Oxr
X-Received: by 2002:ac8:7d85:0:b0:3b8:6a90:ece5 with SMTP id c5-20020ac87d85000000b003b86a90ece5mr4471914qtd.62.1675054131622;
        Sun, 29 Jan 2023 20:48:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675054131; cv=none;
        d=google.com; s=arc-20160816;
        b=SuigyI5rRkrXbKdKnlgatqEQUYlOuTo2TfFec/Oxsgy1/UC8U6qe2k6B7KdNqdPMVY
         KHui3++2E7fyp+957Zym1/gBGKvb1YGaZQD8jHmuP/ZytgoJOtsQ30l8aItSKNkF9j9h
         cYelh/RW3Fesf/XiioboDKV4heA7rhfJ1N0PAtMC9YN4J9tzOJHyjpaOIWjpmk0YB0Kh
         IF8enoQgXo+UuoVJGF7Ypktg/GbgxF0YmU9YQYJalF+kVtxPoTH94IlH6h/Z3OvbtfKM
         Msna6LtmG14D6xPmzB1LfzYRGwEX52PEZy0b/ZNUpBnOAxemZBGOXx+Hv/Vz8GbRl4J4
         8HZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=f1hbXSjYSXulPcGxYTK58WDLylli9Ryc/QtoUHqAfxg=;
        b=k2rRWd0l1beXWqXslf+3uhrdcZ/doL+/x9meZ24Jwpu71WyLEqVv2//9rvuxlRxojA
         LgyUbgbCmCzu2AtnqUKYvrVzN253u/o5vYx4H/YNZI8Xk38HrmL1UkfWcVvxCRlqkiuL
         MtCqmcMlna3m7XoZtjUg+susyxp+1FOkYfxmePWBUb786afaTGL0jFzcEdudRm89aLAS
         dl1KzGpDUhOKfUeBq25uGDt8vpAZH2jJCsf0kObUtJMz7aH0CQA7Z2vM0BcBcNVI3rC/
         U8mvh3kU/2Kv7RS6dE3OxqaLgt6cmmeEvIxF/sb1zrZ0AOWX0dvcSirocdzWNQ7UjKsK
         0OBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YmYL+ukw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020ac85c09000000b003b69d412591si1359264qti.292.2023.01.29.20.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:48:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YmYL+ukw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMM5u-0004sz-Dm; Sun, 29 Jan 2023 23:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM5q-0004sM-IQ
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:48:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM5h-0006I0-3w
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054094;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1hbXSjYSXulPcGxYTK58WDLylli9Ryc/QtoUHqAfxg=;
 b=YmYL+ukwCcCEtP5f9gV1CeJjaICOLlFP5WJjjIQCf+9t+xdSaoJVwMnMYuUJBOy9d0oFbz
 6ClMLTsiYR3k+jhIpBERcfO5wUTGmpbmC6CxN18AsTm36HRU7iV0eQ4aqLCRVkWAYCzSrG
 8nKmqU0wA38f8aMf/jPiS55bwZJ+6KY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-oE4evoCZMeCIi3uKMjxssw-1; Sun, 29 Jan 2023 23:48:13 -0500
X-MC-Unique: oE4evoCZMeCIi3uKMjxssw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o5-20020a05600c4fc500b003db0b3230efso8865450wmq.9
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1hbXSjYSXulPcGxYTK58WDLylli9Ryc/QtoUHqAfxg=;
 b=fca3UmgnhvjKQeWn3PK0VBtgEuwPSIdaGRi9lHRNu+b4SQm5x/bU+CiXcEsW9ux60u
 IZmlLnMKTsyW8j8EOJBhdDil9GdfhKVupO0VIJdZZo80yhN54uXoNg1wMhpjwNUDiJvB
 Gsyd5kjYbz88UGfd07SFBmNLMGUOYVMKzTRXMCdBivN2g9Z1Lp+vrGDQD2zm2ioXqo+8
 aK+lOFHfismg2m78cV9IBTD4ntxDfUFiMxe83NTxSnG70uKAbE1hcCzYd6GQfD1BFmjj
 mgC23C7fUcb6gmNBYygDzvFwQXjdGUYi/fiyO5EwCX/MLgAkKBwj+YOL3jKIwmbFip4u
 jyLA==
X-Gm-Message-State: AO0yUKXDM8wvPrVJxgSq858jvFT1B8irNrqtsGVeqaA2QHkjRGm62fFM
 XNXWwT1nTivcEECScvvW8R1xtR8nmFL9mdslXhyug/lFXdM7dRwgv/j0rLeHwSFioJwg5V3zdVk
 jv7+42rVcl2T+
X-Received: by 2002:a05:600c:5114:b0:3dc:54e9:dfd7 with SMTP id
 o20-20020a05600c511400b003dc54e9dfd7mr3611289wms.25.1675054092619; 
 Sun, 29 Jan 2023 20:48:12 -0800 (PST)
X-Received: by 2002:a05:600c:5114:b0:3dc:54e9:dfd7 with SMTP id
 o20-20020a05600c511400b003dc54e9dfd7mr3611272wms.25.1675054092419; 
 Sun, 29 Jan 2023 20:48:12 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b003a3442f1229sm16544990wmq.29.2023.01.29.20.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:48:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 10/11] tests/qtest/migration-test: Build command line
 using GString API (4/4)
In-Reply-To: <20230120082341.59913-11-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:40
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-11-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:48:11 +0100
Message-ID: <87sffsljas.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tQwYM2cp2j35

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Part 4/4: Convert rest of options.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

