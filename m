Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1917649ejf;
        Mon, 26 Feb 2024 00:23:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9LvEAM6PVmwdLANoheKAmNq+Sj1JLQnX/Jk3Peh9uiOG9H5StnVhHRv3BeiYAzYZM7s4u3GK3uW7CXsVgg9UNw8Sbl8P9
X-Google-Smtp-Source: AGHT+IE9gICk1xryZ3lNJOY/ZiKadTxhpnB+URb44psyk1Socs85WUYih0mzzCIAIVyvM4MveWq+
X-Received: by 2002:a05:622a:1354:b0:42e:8b5c:fd01 with SMTP id w20-20020a05622a135400b0042e8b5cfd01mr768041qtk.54.1708935823512;
        Mon, 26 Feb 2024 00:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708935823; cv=none;
        d=google.com; s=arc-20160816;
        b=xLO5MMvsD+9+1f9t9dZURo3GlyJROGADUrfqUJWhZElYoN5gQh8+b3XS6msNbcO0hj
         qjppUYgAvXFcPllup6uz4jcD3wsWCJPPu1uTxErtBFbvqS1kGnVis/pol3j+PwwCe8y/
         utCEFt+ajnAdv8OHepD9OTghauTvRZGrXY29K1N7VgojCIh15zVTigxDf+6sHpsLV1v/
         tdS5/liKXlgJC4bIv+17FvRbKjbrSIeyp6Iej7s8VB+LjdQnXmMEClxN4Iy53Z20Z2Ew
         lKBc0NT5BdbJS6Arok0EWl+135FV5O+0TSR9QWsUinZlwf46Uzbf4VxCpgHg4Xzig3g+
         fiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=zjPaPGj5s3aVhMFul/v781tyjt/wzgZVW9WmyogkM4I=;
        fh=v4HJEGzdEPtDD1AEc0HNPYnlVgxW9COTVumdfH5xaQs=;
        b=lpmmUlJzDBzRc6iE3fCtw8Cl28xsesUuh6gNvVWmjuF+1T3qCUhd8d+37cikdi7ol+
         b/J3E0KvcJoThNBUKGqorCHPQdXHUaW3IXJznNUeMhAzD9oSWz9EU0Umj8jjQJzvHqYK
         t6GitNnMVQcqeYEKsqguSg0n60i76652fA0nzv1ley9DbCfVK6dxZgnNDurELw1iUEQ0
         iiMUIXa8pz6rjNL3ridKfQO/T6Q1ACWaBCvP3VgP6KzK/4hzAYU0pPicY2Y+3GnIfquW
         4qECA65gRWCgd3SCMfh7eD7kJI47MiBWxQtKhn++ph24nEvkd5x5o5OkgmOfmvIGOD21
         5/4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FdB1E3h6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020ac87449000000b0042c66cff88asi4483791qtr.407.2024.02.26.00.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 00:23:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FdB1E3h6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reWGb-0005xC-Ma; Mon, 26 Feb 2024 03:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1reWGY-0005vq-TG
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1reWGV-0004a1-PF
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708935790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjPaPGj5s3aVhMFul/v781tyjt/wzgZVW9WmyogkM4I=;
 b=FdB1E3h6XhUtVwXi1cKwh3BxWutLDlMjYVv3uQa5NPGJmwNRsrkkx4JeyNMqZsVnEVmWjw
 CUmZ0c/SX2ZHJ6M6j+osSmIjo7L5+cnDg10xwJC4psfwNkCGXahZEZ8SHH0I8aphBu3EdP
 KhattCp9s5s6TXM7WJZ+/k1Bzo4h93g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-2H9wsBxEOCSjOvyk5X0mIw-1; Mon, 26 Feb 2024 03:23:05 -0500
X-MC-Unique: 2H9wsBxEOCSjOvyk5X0mIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1BFA1021F66;
 Mon, 26 Feb 2024 08:23:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CCFF8CEC;
 Mon, 26 Feb 2024 08:23:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 39FCA21E6767; Mon, 26 Feb 2024 09:23:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  John Snow <jsnow@redhat.com>,  Leif
 Lindholm <quic_llindhol@quicinc.com>,  qemu-block@nongnu.org,  Radoslaw
 Biernacki <rad@semihalf.com>,  BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 3/3] hw/ide: Include 'ide_internal.h' from current path
In-Reply-To: <20240226080632.9596-4-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 26 Feb 2024 09:06:31
 +0100")
References: <20240226080632.9596-1-philmd@linaro.org>
 <20240226080632.9596-4-philmd@linaro.org>
Date: Mon, 26 Feb 2024 09:23:03 +0100
Message-ID: <8734tfk520.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.097,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: nLG72uf4GkNa

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Rename "internal.h" as "ide_internal.h", and include

ide-internal.h

> it via its relative local path, instead of absolute
> to the project root path.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

The series is a lovely little cleanup; thanks, guys!

