Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp702033ejb;
        Sun, 29 Jan 2023 20:44:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+43ezon6Ihmkvs4TdQ/S8/eUuM8gzA9Ijpxlsg+VaPNJVk92JFvM8wIR366SeaZMrGSH8B
X-Received: by 2002:ac8:58cc:0:b0:3b8:6b1b:e3a2 with SMTP id u12-20020ac858cc000000b003b86b1be3a2mr3526852qta.10.1675053867617;
        Sun, 29 Jan 2023 20:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675053867; cv=none;
        d=google.com; s=arc-20160816;
        b=MPCqA2Zuup/c3ZPhEB1x5G6jeg26lSBfCq0DvhBeF7C3lGQsn/PSOq7Ln5xizHKAGR
         f8Mk3a5NHqOiRZiOc49SvRDLjb0k4Tcv2aETqUX3PXr757HrM4j+jNgqPQkFJFff0psY
         lpN83M7btk6wOuk9extpJgPxz5Fd/G2H9wLxIz1iNsB3wBPf/fXYCxGkOP/S7ooT+g/S
         Zfy2MPGebdkTO0pliULbyLbxrcQC+pvDd4ick5F/Fl0GNtFhO73AeCW29qchkJAM9dzR
         AYV20Jkajw4F1GUsyf3/l4YcuXaCyWeiek4BzCE0NdLMw7tsYJBUWN68OTl+u9e20zQs
         2zaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=UtK+hwV0BgY8e1Ahpp3J834IkiCp27zR1Cs06bJUyTo=;
        b=MKPtBE8X6mxF5XiBihejqC7W/ozdlndkc6X4Yl886ey1fy0iBCCPRRjiyreTOqplax
         3NCv13W9tpS0Vakrcs/O51MUCm9LweFgMNJNCGlBjenvDYjk0P55CMAR99iW1qG+KvYy
         okqZKb34nzPnbWXC0yXzfTWCB/i0YrYOLSyrnuFAUC4K7MrdOS9AN7jBZ45NPPxqyUKJ
         1X/WV5cWVcRTHJ3vov+5TdlfRwHxh5pNKTu5R0RzF80erPqTfZ3cnyjwTmDaGE846Ph9
         RfueA8Dg2T16G5lX7Hm0In876XJf2LbnohC3l7866xeH9O3uBLwJ7JUc4g40v4N9Self
         aFCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Lrm+pb/j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020ae9e313000000b0071af3cb1067si3229005qkf.561.2023.01.29.20.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Lrm+pb/j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMM1n-0001vu-3H; Sun, 29 Jan 2023 23:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM1l-0001vM-Jn
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:44:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM1k-0005ch-78
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053859;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtK+hwV0BgY8e1Ahpp3J834IkiCp27zR1Cs06bJUyTo=;
 b=Lrm+pb/jrEfHVgclnkN7VO7cJomMCdE/OrYqHRlqy79q/sg0WBTnaArrgrDLS4n2VT+L/k
 dEA5kpITqQri4edAmagYu7q+wxy9Pjb+qgPU/29hoj6f8EH6G4VV8+S/t5sufU/+2BYRRM
 GHzVUKTacpQmHJQlVA4XlDWzFDzk5kI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-ZzWnpxXNOguLfgMPtbygOw-1; Sun, 29 Jan 2023 23:44:18 -0500
X-MC-Unique: ZzWnpxXNOguLfgMPtbygOw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so8887922wmq.2
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtK+hwV0BgY8e1Ahpp3J834IkiCp27zR1Cs06bJUyTo=;
 b=uCvp/OOn8fC/+S6zdN2IlzfnqEqmoCM37DPEIkUXcZSBwcs4QZ6nMv3jJm8+WpwmTt
 rhaWnTBa+w7C8giFPRQfy/o5tPf7rflwGKDkJl1CPE+evNjwqCVXAyoPQWVlkNmYYMvj
 jcoWNza8o4UaeFkKK8Q9VnfiUO1IMgSzpn0FXMxRiEDf+A/pEvF9HJYPbLFGJOECnUJd
 97Q4ZEoJ/rOi3Gq/kqfTMvq8wIqFY5BMyWKU8VwB+f2qsFnvZ+8XSzkd0pn+yL2Ek6EB
 hWEa3bLvYpKJ5s9A0kjaZXJOTR14Ol3U7JcOyFpSNsJb0EcXYONeA4qAJninnH2Z2dES
 pw8A==
X-Gm-Message-State: AFqh2krU4IZYw/kbKt/TzNsrGMH8eoe5X2tIKjELTmIV6AbQ3tQTVc93
 oMuCdEn+Xf9kebPvxVFwszZ7QH9C+KP9Snw35bynxX3dHduDO1ljcD7vUSB7JeFB1s9jdjovZDH
 nhXTlTWoRmsD9
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr45685490wmb.0.1675053857341; 
 Sun, 29 Jan 2023 20:44:17 -0800 (PST)
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr45685481wmb.0.1675053857169; 
 Sun, 29 Jan 2023 20:44:17 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003dc1f466a25sm15411435wmq.25.2023.01.29.20.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:44:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 06/11] tests/qtest/migration-test: Reduce
 'cmd_source' string scope
In-Reply-To: <20230120082341.59913-7-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:36
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-7-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:44:15 +0100
Message-ID: <87a620my1s.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
X-TUID: K3Y/4vvxRCs9

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I am assuming that you will pull this patches through tests tree, not
migration tree.

Otherwise, let me know.

