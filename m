Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A8BC88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 11:34:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x64x5-0007Q4-Py; Mon, 14 Sep 2026 07:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64wW-0007DU-SN
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:33:53 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64wU-00009u-DG
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:33:48 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e56a1fe3fso1393025d50.3
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 04:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385625; cv=none;
 d=google.com; s=arc-20260327;
 b=g+ifqMg0UX2WBrwzzo7kxVMjQiPPkkJgDrvBABNOS2p9dv16ptWtawHZVG+0Y0f0R1
 v0r7QOfPqrkzedmVYRKIIaXThlWqsjZV5W0s3xiiCCxJFFdUzT21+Qa9aNLBoeAK/lHh
 kVGxJ/i/djAZPym0/MsIdtXmzKQ7uZW/C863rlYQ+O/JUOr5kvJgJKAhiuX7XpOJcMdn
 wXP4eiOo2YSw8RCdfcMh9FxlOjxACwCwLBvnN0GQfUD8oXA1VCV2k6IlEVDoGMFum+Zc
 UISW3yJNZLyBXQ2k8BoBo49Xes4gMplT54Ql1/4ZUQf2AImkt3Levh3qfQ07KnauPj1S
 vOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IX/J89ui+4pqIuEUdfE+impabENncLUrNUGlewxusXE=;
 fh=7//hES6XArTVc+Zh00nG2MsWuL4CHWQvx8y6lNBpctQ=;
 b=SQ3MNEu0b7HY3B9chtg904K5eqK/DtSRi76r+AxTjqtpo01rMxU2479XQ4w5AHts6k
 mAtPAihpJEmsiiy1Fd3f6wcVdUxv8EZrW/4a/40mbZ8/M/d/TVrr88xx6JTmRdbWXv66
 9UUMY4ROq5jDPhJhvQoA64s7PCkdlZf+KISndZoTxa9ijwEsOGQywWZKCt6myKD6MHuX
 HUgRAY33D2CQAInJjNO3SfLFsODGNqrN/KulN/Dahj4I365NimVq2DtSMRRGf4Dz4AfC
 Pad4HoVgrs77plh4lZnbznZva/DqOYENXt7wF5ICB9zYsQuJOM/YOjwhlGGXzGDEPnlW
 9xnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789385625; x=1789990425; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IX/J89ui+4pqIuEUdfE+impabENncLUrNUGlewxusXE=;
 b=sxUJue8S8MgO561l7X18gxeNn+HhfmGwWMXTrHW5h7N1wwe6pBJ9Xj2wv5sfI+txTC
 JPwK4gSvPXcv4rOkWGtZ7rd2skOBADAV8ibXGd9fZ5I6Pa8E/l34bxpG1MEqn7OTN84B
 ErvEwd8mMNSi6JmYP24ruw5Tk+vEPW8X6AT7AU5GwDa3pY/JkFKBYaEcx4Y/bHcgMH0b
 SDS7Zb7zezMJXAZGxDv3Rfmg/2QnLFGfPiIfoHZcEZpGLSS/UaHxdVrPI/8p5bwbSBVw
 qcsYIr6giZnv13s1tr/KTc0UIEVTmaGAskpm2og2+rGkswlgriLIsqMhMlrm7Q8Vj2Qb
 8q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789385625; x=1789990425;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IX/J89ui+4pqIuEUdfE+impabENncLUrNUGlewxusXE=;
 b=V3orOV58YXzJ8g3NFSa83oVnTlfAGgqoAvayLgtEcPjgU6ONXN7hBFM2k8CjTA0zfe
 P2yuWO+Dwe5FObnvFx/36GTTrDf0rOiOIWHHT1F5DuLzBgFT7cV+TRSxo2ZuxauiSW9E
 IK4bu8jQqt7BmC1cSHoCx8wU9dRicw8gBUABAecdfyl2dX6owPrjC4FY0ky2xzmcwEf3
 q+1xh+4qKMRFWb9PX7D7P/lk/gpwotL0iWhP0ukzXb0Av3TKY0ms7+ssR1B6zdQ5tx9r
 CMOsrPm2bk9aeKhjU+2OsWR/eKjCcdYoRbs1o0HxMVAMuKZWKiJnHmUIzQ+xE6BFAaPZ
 MQTA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSnxdE1glBBrgOdozxx7yemhk+8OOeKoqH+rfW5aLHmagqu5giuTPGs1yh9Lt10aaI5Bua89AjbA==@nongnu.org
X-Gm-Message-State: AFuF++niEDu8YX6mgC0xIhDMGrId8mUBZVfLY0pQd5Brwh+b4r20ZL5U
 4OfMKd/GT2Bbwvj7EJw1DaHo8aTTkpJ9jD+EeddVDxesqwt6MCCD7+cQ/Td4GCKcyZAevHaEhgq
 FvHR/5swjw+aSvuqUqpT6WEk7VXF2qgCtMv6V7unrbg==
X-Gm-Gg: AYBFou2a3XLSGW5OMNks04sKyNEgFBKaP5qbSCZ37TcbeODNuzuEyMqn55nj6dU1aa8
 Qag921extH1sqMxWBuxwyYoMXfspge6zoQyNUfkbOtFWtegP97UDKCtcyMrMRbJPgGbHzNFkDKO
 mvg9paQcWUvbF8lQSicMBCVMgL9fNqDV/b2fcnEYjyKFoNrInEDeopTJjODVLOrZ7hwgGAsEuE3
 3NGwf/HwrwvqG5BBWCR6QKNI/9lLb0q+kozj7vDd6pVeabSWD05bqZYp4Ig4IVF5vKPeUPONJbn
 b89BkqAmIUkszpkr/lZE4CWFGSWj5HUrUQ+cESOyB/shrGk7WQ48oomD8qvN3Ve3EVziak455ZP
 HTHx06IAOL6XOVxrA/Mde1hIhwIupX47rCQKPyxR6
X-Received: by 2002:a05:690e:454e:20b0:671:214:30a6 with SMTP id
 956f58d0204a3-6714e1a2387mr242294d50.94.1789385624534; Mon, 14 Sep 2026
 04:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
 <20260906-nohmp-next-v1-6-2b21e63974f3@redhat.com>
In-Reply-To: <20260906-nohmp-next-v1-6-2b21e63974f3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 12:33:33 +0100
X-Gm-Features: AcwNN1U7ac5_-fDMC6KnSxbCu8IVhcDryy5hxbN-tn5BJ-jkcnxG8dKLJMTKdXA
Message-ID: <CAFEAcA_Ki-Rt2S8=db+z1zfCNpeRXXqMHtiG7aKCLWPyKYDfYw@mail.gmail.com>
Subject: Re: [PATCH 6/9] tests/launchupdate-test: fix fw_cfg leak
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Gerd Hoffman <kraxel@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Zhuoying Cai <zycai@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 6 Sept 2026 at 09:54, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/qtest/launchupdate-test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/launchupdate-test.c b/tests/qtest/launchupdate-t=
est.c
> index 12a09079ae91..beec902caa6a 100644
> --- a/tests/qtest/launchupdate-test.c
> +++ b/tests/qtest/launchupdate-test.c
> @@ -149,6 +149,7 @@ static void check_error(void)
>      /* should fail with LOAD_FAIL since it was not IGVM format */
>      g_assert_cmpint(status, =3D=3D, VM_LAUNCHUPDATE_LOAD_FAIL);
>
> +    pc_fw_cfg_uninit(fw_cfg);
>  }
>
>  static int64_t get_image_size(const char *filename)
>
> --
> 2.55.0.543.g5ebe2ebe4ea8


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

