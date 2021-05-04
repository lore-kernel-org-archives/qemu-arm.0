Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3487744lfg;
        Tue, 4 May 2021 03:41:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlV77P2UqCpDSGGN0jMcUWi4Xnum75FM9cwv7qwuFnq+PQT09jzuVt/6EajMgSTAeYGfk+
X-Received: by 2002:a37:7d84:: with SMTP id y126mr23493687qkc.155.1620124879904;
        Tue, 04 May 2021 03:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620124879; cv=none;
        d=google.com; s=arc-20160816;
        b=bqvNl4/yOcMOrQ+/z+XlTtq+XplJHJrpZyJ6H0Po2euVaYAnUSlVqPviFm483oSQbm
         TAnGoWlpzbM3vqC6fKVw9U3vcv63t3TX4kfDD5ue+eXyhOYlFqyrXrW/6BXXLBSRvhsV
         CCOiackFqI+Gwi7SK/ThenYakdb6OOVlJ1b/YYpt4QknLYgrrKKppBZ9ACVQkWsS37d3
         1ZIoxr2JAdTAEeFbxqnQ6Ho+L9hrLVhgIq1/LVGMAeqm1Xs7zsxjdzdgtVh8bkb6HY3W
         iv7NZR1wZ4uKcDvbZrtUpZ2JkBo7VIcyGPZnWwgB73zWob9ksy6UclA9Uugl+lsGBJ7p
         eiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oocjvv7hcx3R63GzjXWkQsbiVGktib/UoD97zbPxsp8=;
        b=QTcqywAxUTfe8JR5OJDY+/SuEWNazagxmtsG7Dr+ISPOJ1yVZ7TQ0NFrj+vSB/6oF/
         IwnrpqVvP84raFkGQZpjgx6zO9nrD7ZLXqp1k5ui48zbrgs8zVld8fLlg78FlaPwBd6S
         3+K97c6az6myy0AfabP2aRLJGXdqcazhFNOCn4BbBi3LxFRcX0eZGSsC+1ITDxy+ig2N
         KvNrwOhFsXimiOs3RXBkYONseA4tIa/1CSInaYLlPrmW4atIp5H8ndBdsklYFxUYdDHb
         hKdey869FjEfp+fYJAi6TChJrdez9Z6p5y9IMn4qMbTeEvoBfCKMpWrdig4XDXUlFXK0
         7mnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mjZDX3Aa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si10295168qvt.63.2021.05.04.03.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 03:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mjZDX3Aa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldsUR-0004SC-60
	for alex.bennee@linaro.org; Tue, 04 May 2021 06:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldsTv-0004Ou-FS
 for qemu-arm@nongnu.org; Tue, 04 May 2021 06:40:47 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldsTt-0007Xw-5h
 for qemu-arm@nongnu.org; Tue, 04 May 2021 06:40:47 -0400
Received: by mail-ed1-x531.google.com with SMTP id l7so1192961edb.1
 for <qemu-arm@nongnu.org>; Tue, 04 May 2021 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oocjvv7hcx3R63GzjXWkQsbiVGktib/UoD97zbPxsp8=;
 b=mjZDX3AaCgqtyw/jP8lt+rBKXEzjiR9gIwhXRoVGUNx2l8K9f+INf8TzelEruFjzZr
 cqNpkp4QbiHa9Gzp0obTel2o3Mhk0BfQRwvL3GrV3YG9MwEkyMjw5xu4CMvk5zY/D2TG
 Bv4mNQDURNHTpQZvOhft8D+/+D53i6Y+d1AbIIuw3YR7T5L363fYubZDbJBB8oNDmYch
 VB+tAsNhVFqO6qogS0OaTqGiqLXe1/i5Ouw3LCynYkml3RsIWvlcl5cWpOERMEmZRlIf
 zqksLogNNyKUdm2CrYZR8DRz/iAdfB2Dj+GxoEE9X1mmzn4G828Q0VjKJSLmYGpiA84q
 bdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oocjvv7hcx3R63GzjXWkQsbiVGktib/UoD97zbPxsp8=;
 b=RrU08rr8oOP2OpksjF3m48SLuMgAI1XtIn9RGcJ3OyXrb0KymyIDvL3IAVMKSOkQb+
 WngbwjTBIjpz7nH9cRxlShlm0z7wOM7mdsvAWKxCv4ZtqarAfMYN4K5nA0t3v/lCCIfT
 F2f7dICLK938TAimDfiGLEdXiApkCP2bGTKzhZroYVYSFlyLaxZ2Zl5iibErVsTcaFN5
 luW6i8vVLDJ+BK7szuUD4gGDECwkYOHPefMBL9QJegv6i/hi1aubN8KJM7TAQG3RYQ3Z
 49VJpm3v073fBU6K7iGs23ZN6SjeDk8g22bJgJx3Efe0FUAFty2W/gD/6MB2h+HhCfZ/
 mt+w==
X-Gm-Message-State: AOAM5330EVJcqNB4WBeQfSHRhJs3ne0ukTxgP1tf1H8usUPfEtApkayl
 U5Ozap8msLviu6L/uOOQgbwQFL+byistSOVxfokkGw==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr1886881edd.251.1620124843348; 
 Tue, 04 May 2021 03:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210407225608.1882855-1-f4bug@amsat.org>
 <f7138901-3e7d-14ca-87a8-317089d51195@amsat.org>
In-Reply-To: <f7138901-3e7d-14ca-87a8-317089d51195@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 May 2021 11:39:37 +0100
Message-ID: <CAFEAcA_YzAVXmZDuaP3iThqqdUoknNZcBtqH8xsGukXrjxAVXw@mail.gmail.com>
Subject: Re: [PATCH-for-6.0?] hw/arm/imx25_pdk: Fix error message for invalid
 RAM size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7fY50HNt/KYb

On Sun, 2 May 2021 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Peter,
>
> Could you take this patch via the ARM tree?
> It has been reviewed twice.

Sure; applied to target-arm.next, thanks.

-- PMM
