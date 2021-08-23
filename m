Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2124331lfg;
        Mon, 23 Aug 2021 11:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU14Y48Fgfm36PLJNbZHZQUwAlTbGRYQ+qCB15mJx37HKOJAzyOYdfpkw7ZnxxGh+e9G+h
X-Received: by 2002:a92:d70f:: with SMTP id m15mr23663980iln.162.1629744811517;
        Mon, 23 Aug 2021 11:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629744811; cv=none;
        d=google.com; s=arc-20160816;
        b=k6Wn0sYY4xPgkM8NFwbCB/i9o6z3J5Tx2Zl4JxJ6J3EYb9/w3y7b/fH0GVDlxU+pbj
         fne264c8SKCFjDby1W7sbmhYzjPJSqO72yUSLj5cuF5prvCtBBbi5dY3C24bDUFN2oX2
         x+2WHiWF70tCKQMUHLNy6j47pWL34F7BDTSMtxl5cOuibcwP1xTO60kJfajFlr4kkLAf
         +l+Bs1plMvzHMOKQhcH/QYHI5Lk96pN645nipJpvcrHjMebMJd2W4SCn8DGiKtJe4Jt1
         gU0iY74VvvZx2Qm2sHBamEKiaXmqyk5XIscNp7JH74ytsBl0k8O2r7AwK+G+hAo9LVK4
         9TOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=GcX85zP3xBaAxRc497m+Olfpjg1Pce7rhiZrTMuOhSE=;
        b=hOOhodaIua4Mm5YO5iN11Y5k6xLT1adlCrguSkzFVtpND/VXsL7hdO0h2mqXfv4YSL
         M42Rp2s/Yz7t7loqkKiooDGYZQfDpVOelI73EmunIhArAjpEq17A804KfbfBceuU2nBz
         r7wP3B6SCppEjHvXmH0yyvmrgr1dcIp9ra7mU3WYVcYxehXj3vcpyxHRVRmgO0cwAhQG
         ta6LkywTIbXLwOD5FG89wAyhZyb/uz+fECLQd09cin/ZtFkZ5cJAAvOmD409AilEupkz
         moxuokojt4poaJoF6C7L1PfUl4Jh+wnB+vxoOMqVY8XasQYHc8HOIHZ3tyhSF50ccU3s
         dQqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h2R3luP1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si18217659jat.94.2021.08.23.11.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 11:53:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h2R3luP1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIF4c-0004th-PY
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 14:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIEuY-0000rK-Mn
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIEuX-0004YS-3e
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629744184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcX85zP3xBaAxRc497m+Olfpjg1Pce7rhiZrTMuOhSE=;
 b=h2R3luP1gU1j+qmZWJ+DZP2mjLf8X6dFNqsLBnNlRQ+7pMT67xyamS6v9MQyxGGWcZU3pw
 /LegiCSqDXtPkHtAH86XDcf+kf68PYyeiyHPaxw/CObbUGtBlfKDTDUqGjrPSWIU35pBBl
 TjW160qaK/Btq3AuUSpys9NoxW87n04=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-P8zzbW1LNtuKNpQwhrsAUQ-1; Mon, 23 Aug 2021 14:43:03 -0400
X-MC-Unique: P8zzbW1LNtuKNpQwhrsAUQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 e17-20020a0562141511b029034f8146604fso13058111qvy.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GcX85zP3xBaAxRc497m+Olfpjg1Pce7rhiZrTMuOhSE=;
 b=aNaqKkUIdqO45OKyb/a/cVonuYA9CoTE25Y5xBNSEDeKBeykfxtE/gj0ryw0yz2l/x
 YTyEC9W7HUwSM52OW1FgTUcTVIYjJ5StZCA4s2mzSVkHce9raITuX8ZvlBKf6MXkcWpd
 q7Utsvd9ncn6hNiakIixmMPr06Ia+CttaFT9X5JEPCelyS9Z4q001qqCu26Q4X9i7iMT
 LcB9yDvSbXlaQBdX7M8qI2osZ9+Ybw/oFQ5IW00+WHlIognVTXk+03NPV6BcXImcNDIT
 09fCo3XwdJS9BAGjKzymPBmxKYKc0FLUHYK8LLRQTwNltcelddpPytFORSbJN4nof5aw
 TZSw==
X-Gm-Message-State: AOAM532uJNw7vWHr8bXh2QZGcHrnrHjpybdoMeQ/ot8bGOibjcxzfSqJ
 2nk8N5vWRsNkjDH/+bFsVFFKWWp68gIyaQPLw7LohuXFIbHBBghlQVPb0fVgmovOJX4o01OdlDq
 Nj5nPwGEYOeotJhc=
X-Received: by 2002:ad4:5a06:: with SMTP id ei6mr7058108qvb.21.1629744182732; 
 Mon, 23 Aug 2021 11:43:02 -0700 (PDT)
X-Received: by 2002:ad4:5a06:: with SMTP id ei6mr7058084qvb.21.1629744182486; 
 Mon, 23 Aug 2021 11:43:02 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id y2sm9231970qkd.38.2021.08.23.11.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:43:02 -0700 (PDT)
Date: Mon, 23 Aug 2021 14:43:00 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 4/5] softmmu/physmem: Introduce
 flatview_access_allowed() to check bus perms
Message-ID: <YSPsNA2WW8Sa0LCE@t490s>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lIteTfQhE3XC

On Mon, Aug 23, 2021 at 06:41:56PM +0200, Philippe Mathieu-Daudé wrote:
> Introduce flatview_access_allowed() to check bus permission
> before running any bus transaction. For now this is a simple
> stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Shall we squash this patch into the next one?  It helps explain better on why
it's needed.  Thanks,

-- 
Peter Xu

