Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp702643ejb;
        Sun, 29 Jan 2023 20:46:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+Etpg88GvygAzruVT8flsSWUpSS0Z1ic3Eet9nkJ7em7W3kwBAR+095ekXkPqQKqGgf/94
X-Received: by 2002:ad4:4dc2:0:b0:53a:d85a:f11d with SMTP id cw2-20020ad44dc2000000b0053ad85af11dmr7518526qvb.46.1675054001079;
        Sun, 29 Jan 2023 20:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675054001; cv=none;
        d=google.com; s=arc-20160816;
        b=dXveO2PFLSsGjJ/ruNTnuEns+UoFeBC5hTwSf/ANisRKfi9kQdp3yFMIPqGmAMGa/D
         QDOrPEhX6OKZTKSJGjLaFb+1tvbJgwEK5fTMcx3fIJUFPxh2ftJYR46sdrOy1y4Q6wWW
         l6swcDPKPVuNgdE+w9aR/sOu0mPyPcIFSrjFQHsXfCqWn+EQ2bqy+pH9ZmXn9WbPMtzF
         7WwLJxpqcBuTCBmfhyAIo/Dh9xJ8T9UpFhk6sHxLkzRLKAiUNZB29oHZeK/lf6wS4yV1
         QcZ6o2HLOd62X6A/N2h1WiwlQd4WV0n0uLmoLNFXlKzmE4wfx8KWegylcHNLSSfQNbQU
         N2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=g2e6B/Hlbj/KRSqA7n1bDxKoOF7IkEqfLRb1w4IvCsY=;
        b=ocMnO61hQHHLqFuNfSYjUnZTl0TPKNxaJtpTrMG1a6VNBch1bEZ1MuIqwLbcU765OB
         2Dpdyx52ifYJTW4qDxiU+bigMExifs3bw7ZoYyFPJVzgmU4Y/m/sCfw3gukwAX7stfPg
         +AjgNBOb6SU1Vd2CLRUsoVL2kre+OtlYPx/cgTYVvz9L2JJDwA8xRucOF6TVVG61e2Mq
         Z8cIq2w9LlapzDDP7igKX0TLVXsGheqQeedns4dT3MUKLbJfBaUNKb6fjp1GN/RTQF3j
         3mzatMuctbbtSgmCgEenADwwCR5x+06iLxp2GKg3ZE5j4PjXLW5INhBWVveIxd+B3xLA
         pZKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCbhmW8z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ok14-20020a0562143c8e00b005347a785f4fsi6399243qvb.28.2023.01.29.20.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:46:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCbhmW8z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMM3w-00039q-VT; Sun, 29 Jan 2023 23:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM3k-0002zl-MH
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM3j-00068U-Ai
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053982;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2e6B/Hlbj/KRSqA7n1bDxKoOF7IkEqfLRb1w4IvCsY=;
 b=TCbhmW8zfeZUVNH8lTQ4HDVTZUlDXvSQ7kYJNKG+XrSf09YGdchQJr1aRcq5xFhgJNQfNx
 PsU9AnK8lKAohUEldhpMIKGnihTOWGGNsBrQN7EArDo26IEHACUIx4MdM4QEk3HGnhdC2H
 WJMscCV8pTyJL4jrsxxCXOOZsFXRF1I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-5zKowcwDN_enqGh320DBzw-1; Sun, 29 Jan 2023 23:46:21 -0500
X-MC-Unique: 5zKowcwDN_enqGh320DBzw-1
Received: by mail-wm1-f72.google.com with SMTP id
 iv6-20020a05600c548600b003dc4b8ee42fso2955490wmb.1
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g2e6B/Hlbj/KRSqA7n1bDxKoOF7IkEqfLRb1w4IvCsY=;
 b=yXeGIeg83D7fZjGDvddV0/zTXn+geRWqmlHufs1oVMyMdrpYSMjGthxO84bpM2e7iA
 us29MjO14H8dRz5siK5/TRhtjDV8w4wavBw556giYZoIADcH05xIXsiS+/YSUiqXzOTF
 4qDw7OmKSBd1KPfVLLurdldzK51yGpHbDihCgGBXWtcYK8Ph1EUxMPuXbEO5mG9hoQFo
 yBTEmk2xf7E3B5dFcx2hJ13rsOCr8pBXEc0tuZLezVvi5crfk9AQZXR1TVSQ47X8uFlJ
 oxlQUMoI6h3zAIp2zLN4I03G/w76pnxlGZHR4tla1Ct6GD98CiOhhAtGeq6IPO16BqM5
 DmnQ==
X-Gm-Message-State: AO0yUKUSVrprN35AkTyBbFMFHZBHsXwFD+GyxkiVVK4VsmhrdT6X8Yxg
 eIEXcZOzVbB683hw9l479QbFAylADixyt280146eajufTZk5rZevF17tsVazz+t7llLTvLz85vV
 KjtFm9khNlif/
X-Received: by 2002:a7b:cbd0:0:b0:3dc:5ab8:7d74 with SMTP id
 n16-20020a7bcbd0000000b003dc5ab87d74mr1370405wmi.3.1675053980221; 
 Sun, 29 Jan 2023 20:46:20 -0800 (PST)
X-Received: by 2002:a7b:cbd0:0:b0:3dc:5ab8:7d74 with SMTP id
 n16-20020a7bcbd0000000b003dc5ab87d74mr1370394wmi.3.1675053980064; 
 Sun, 29 Jan 2023 20:46:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l16-20020a7bc350000000b003d9aa76dc6asm17519598wmj.0.2023.01.29.20.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:46:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 08/11] tests/qtest/migration-test: Build command line
 using GString API (2/4)
In-Reply-To: <20230120082341.59913-9-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:38
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-9-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:46:18 +0100
Message-ID: <871qncmxyd.fsf@secure.mitica>
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
X-TUID: 5z1ppIoGK1Tw

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Part 2/4: Convert shmem option.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Again, much nicer that what was there.

