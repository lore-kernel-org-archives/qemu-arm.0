Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B449C982C1
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:50:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6spK-0007JI-Fd; Wed, 16 Sep 2026 12:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6spI-0007I4-Va
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:49:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6spG-00016g-Rh
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:49:40 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeY5u1855121
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nbKSKlpR9/Wz4BX9Dl9fcrMyp5vqJRmWMp1I/A4o7ek=; b=VdC1rMsElmhmukRp
 jE8ZkBJOF4c8pugNPNjEByAGLAN2Mwf+x73EIUoAU0vycNWAlGRuQ9/9qNmRCfeP
 eHvL8jrjZJdj5AaXaeyNDlOT6lC8sGdo4uHTix8B63fKGVuk4wcNDn4qtrX0ogFp
 jNrg4RWIP1EPGrZz7xK0lCwMeehs7gObyVzrJiggox9F8JQ3OEN4x9Kyb11vzsJg
 gW005KyKpS3gsWOJRa0F0YeKtnjBi6lAmTJ2QFMF/xyKKjg80++XhjNZCEJwZIjN
 WiUUNNdFiHRfbGnlOSGl7QpCJipVnYSV9EeMusgeseTCkuinyI/w3B3mbjzhGsQo
 ZjPjmg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3t4f0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:49:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc4b524ce78so4377357a12.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789577376; x=1790182176; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nbKSKlpR9/Wz4BX9Dl9fcrMyp5vqJRmWMp1I/A4o7ek=;
 b=Wlcg7z3eEdYbfWESzkitd3VeZJ9ntmOrJuQPh7r0CFG9VaCZoAMrWbOxmHq6/2WFLE
 m75HmbSk8UyT+ebDEWhCQmAChtSCaSvdc+L77RRy7f0cTQyH/CDRyAXGJDIL9DvdXMHY
 WukhGskrFlEl96cevm1T99eDcrzjceltSGdlOdhhdwpemDBLRjdDZTKcCWN/eXaiDpYR
 y+NUIYOB9b/Vi8u7no/S6Vqk+8I6DdlVZaUCWazZRejmAOyJnAudtI+A4RgGBjpteez0
 CtzLPfZ1+tXE1LIwyH6xkGChSvY9CqaixKSgd2PG9bymBCgWrx7z5ks89AZjc5Sw8weH
 N0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789577376; x=1790182176;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nbKSKlpR9/Wz4BX9Dl9fcrMyp5vqJRmWMp1I/A4o7ek=;
 b=RtZ7wXY1qZ9JZHsNCSDvxQ1WY7kCIExHKFsBU1eK+pfJH38hFQV975pZVI4nYEnBdV
 lBuVjqweKXeoaseolS4eNM4L4rv0kWMu/Udw3KiegS2YvjmpAVQs9QxwaixB9919GSgj
 UVCxa1/bE9KJfJWpR43f0oR5zx3tgu/77oIme9AyBkftqTN+pe5FA2auMbem01E/Sxgq
 FqeZ09M7otPrbdvfBmuuinHqmekQxwOxjyGEkGX2BtSIca3TZoFg8vXr8S0bGwKbSMvG
 jgUZ2qZVCllKA4R9VJm2LMUx7yiOAAZFpzcl/X8fIvtth8r1HO8FAfhuppJyvLEkMBxt
 0Teg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw0iypCqYREmIHe4DrE3sHgph44rF+K1G3md+ca70Cj6YQSrBBZ+y857bRAX9jdivw+/z2wmWh5Ng==@nongnu.org
X-Gm-Message-State: AFuF++lxXLU9iyCakMsm37ikIAxn3mKHsgLYqu6bwlaLRfmXifpXVml1
 otwDIXcDZ9MEDet4foqYzapBA8QmmdjpDadhu57Ev37B4x/SUbW5WCsdulSfokW9S56TkXixQhf
 Yko2O7oT1Q+d32zhDVEQ9DWaUUlPQk5yrDfH9MipzsIhNjnyvpapIaSI=
X-Gm-Gg: AYBFou3KCinNgiUnrdUCPMA1qGMwaBNMaLaA55CGEvO9CRHDFVw8q0dFWWZFQ0v3iTx
 GyWhY0DDp6JHNNPVmtst7RRy4i33g5htT/vDep0ii+ZDI0GFJV540jBEKZV7Q6d0a3XD7uFSKI1
 mbR2vF6/XLmvzT17b0uoP7MD+ndvKoCMAL7u/WwKtm+aJX3SO5RO8trjqNhxFUoBFIzz+4u9YGL
 aoM/zQsb/KWkk0P6AMlWodpefdZpNuseB7Egp81yD+IcE63p5tEhVtOTfsWo+JnahBRRKr4te20
 Icfj1YDC9t2H0kdQtMn7rdtR1SuRvi455UgnH9DlGQymesKgnccCd+7Zp1Q2mfFkICfK32QOaTB
 Q1T4K+p1hfLfwVcQxuy8m2Ou7frkTuFMUYa/vWpFT9B6AR298DsTVrsf3HqYnvDbqwrI3
X-Received: by 2002:a17:90b:384c:b0:39d:8794:5564 with SMTP id
 98e67ed59e1d1-39e1e48a48dmr7145267a91.12.1789577375813; 
 Wed, 16 Sep 2026 09:49:35 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:39d:8794:5564 with SMTP id
 98e67ed59e1d1-39e1e48a48dmr7145188a91.12.1789577375273; 
 Wed, 16 Sep 2026 09:49:35 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14395d5d0f3sm7642100c88.12.2026.09.16.09.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:49:34 -0700 (PDT)
Message-ID: <6c5f7980-cf55-4b9b-b74a-19a6b8c732c9@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:49:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/19] tests/docker: swap --quiet for --verbose
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Brad Smith <brad@comstyle.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
 <20260916153013.2134555-15-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMCBTYWx0ZWRfX+57a48UBV1mB
 99I/u33cOC2MtmeMMD0MC+ePBJkoo7T0HtzzZ65Cu8UXGO1ZqNVFw1U11hgWFvWYBZZxqCMwmq2
 y+2S9vw1WEXvciBof+fn8KUgbpMB/F+1M4fZoMLhZ7GWqJvenUlryxmqptmAv6c53Z2RXQhpnDp
 oL8JbaZvlrbYPNOfqKXhbJoGgGa4qt76FDPPwGY09gNEUkjrwp2EYCieHtk0uaWJ8o68G3NROm4
 kzNdm0zI1bWR5C+NnzXBQQSYk7xagJhY2WNjGR5kyA54rEgfBqmM5bOoTngad1yehcwKChXOKp3
 ZOYW2R2SXcTt7BrBFZvL/z/AgYYI5wgH5SNcV5CtdnGz+7tBLnaakrIzrL/2H35tgwyKEi9fs7j
 ZYOu/bbXUa75hO71b63rdoLVMbZptmaBM+gtlXQiVhAt1bxBDvsRnIClR0pg27Jbe3If2GZo4iy
 G08BnujiX0akXL7C8Wg==
X-Proofpoint-GUID: qRlHbvV15rmpsp05idhBmXsOwLPltBVi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMCBTYWx0ZWRfX25CA/sSgSx6j
 11oguCcG9yk5Uy/BF6LDAYswP4gZ91Jb45x/67quktHjTT6eevvaTKn6rotMjAgYX9HgD71d8ZQ
 wcjNDb4F5/0kT5u75LPrebCR8Eu4QHQ=
X-Proofpoint-ORIG-GUID: qRlHbvV15rmpsp05idhBmXsOwLPltBVi
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaac8a0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=dmxABcaeaIdBPb2-SMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160230
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=ham autolearn_force=no
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

On 9/16/2026 8:30 AM, Alex Bennée wrote:
> Running the docker build in meson spams the output so default to quiet
> and make --verbose the options. If we want to expose verbosity in
> meson we can deal with that later.
>

It "spams" output only when build is really done. If image is already
built, then it's silent. I don't think it's worth silencing this
completely by default. Maybe we can postpone this patch to when it will
be correctly integrated with meson, there is no emergency or fix here.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - dropped accidental libvirt-ci inclusion
> ---
>  tests/docker/Makefile.include | 10 +++++-----
>  tests/docker/docker.py        | 22 ++++++++++++----------
>  2 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 74bf471f171..85825d74dfb 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -72,13 +72,13 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
>  			DEB_TYPE=$(DEB_TYPE) 					\
>  			$(if $(DEB_URL),DEB_URL=$(DEB_URL),)			\
>  			$(DOCKER_SCRIPT) build -t qemu/debian-$* -f $< 		\
> -			$(if $(DOCKER_V),,--quiet) $(if $(NOCACHE),--no-cache) 	\
> +			$(if $(DOCKER_V),--verbose) $(if $(NOCACHE),--no-cache) \
>  			$(if $(NOUSER),,--add-current-user) 			\
>  			$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))	\
>  			$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)), \
>  			"BUILD","binfmt debian-$* (debootstrapped)"),		\
>  		$(call quiet-command,						\
> -			$(DOCKER_SCRIPT) check --quiet qemu/debian-$* $< || 	\
> +			$(DOCKER_SCRIPT) check qemu/debian-$* $< || 		\
>  			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
>  			"CHECK", "debian-$* exists"))
>  
> @@ -103,17 +103,17 @@ debian-toolchain-run = \
>  	$(if $(NOCACHE)$(NOFETCH),					\
>  		$(call quiet-command,					\
>  			$(DOCKER_SCRIPT) build -t qemu/$1 -f $< 	\
> -			$(if $(DOCKER_V),,--quiet) 			\
> +			$(if $(DOCKER_V),--verbose) 			\
>  			$(if $(NOCACHE),--no-cache)			\
>  			--registry $(DOCKER_REGISTRY) --extra-files	\
>  			$(DOCKER_FILES_DIR)/$1.d/build-toolchain.sh,	\
>  			"BUILD", $1),				        \
>  		$(call quiet-command,					\
> -			$(DOCKER_SCRIPT) fetch $(if $(DOCKER_V),,--quiet) \
> +			$(DOCKER_SCRIPT) fetch $(if $(DOCKER_V),--verbose) \
>  				qemu/$1 $(DOCKER_REGISTRY),		\
>  			"FETCH", $1)					\
>  		$(call quiet-command,					\
> -			$(DOCKER_SCRIPT) update $(if $(DOCKER_V),,--quiet) \
> +			$(DOCKER_SCRIPT) update $(if $(DOCKER_V),--verbose) \
>  				qemu/$1 				\
>  				$(if $(NOUSER),,--add-current-user) 	\
>  			"PREPARE", $1))
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index d7eb4cf6811..10cb4cbde11 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -312,8 +312,8 @@ class SubCommand(object):
>      name = None  # Subcommand name
>  
>      def shared_args(self, parser):
> -        parser.add_argument("--quiet", action="store_true",
> -                            help="Run quietly unless an error occurred")
> +        parser.add_argument("--verbose", "-v", action="store_true",
> +                            help="Run verbosely (default is quiet)")
>  
>      def args(self, parser):
>          """Setup argument parser"""
> @@ -341,7 +341,8 @@ def args(self, parser):
>                              -- to avoid confusion about its flags""")
>  
>      def run(self, args, argv):
> -        return Docker(args.command).run(args.cmd, args.keep, quiet=args.quiet,
> +        return Docker(args.command).run(args.cmd, args.keep,
> +                                        quiet=not args.verbose,
>                                          as_user=args.run_as_current_user)
>  
>  
> @@ -390,7 +391,7 @@ def run(self, args, argv):
>          # Is there a .pre file to run in the build context?
>          docker_pre = os.path.splitext(args.dockerfile)[0]+".pre"
>          if os.path.exists(docker_pre):
> -            stdout = DEVNULL if args.quiet else None
> +            stdout = None if args.verbose else DEVNULL
>              rc = subprocess.call(os.path.realpath(docker_pre),
>                                   cwd=docker_dir, stdout=stdout)
>              if rc == 3:
> @@ -416,7 +417,7 @@ def run(self, args, argv):
>                   for k, v in os.environ.items()
>                   if k.lower() in FILTERED_ENV_NAMES]
>          dkr.build_image(tag, docker_dir, args.dockerfile,
> -                        quiet=args.quiet, user=args.user,
> +                        quiet=not args.verbose, user=args.user,
>                          argv=argv, registry=args.registry)
>  
>          rmtree(docker_dir)
> @@ -435,9 +436,9 @@ def args(self, parser):
>  
>      def run(self, args, argv):
>          dkr = Docker(args.command)
> -        dkr.command(cmd="pull", quiet=args.quiet,
> +        dkr.command(cmd="pull", quiet=not args.verbose,
>                      argv=["%s/%s" % (args.registry, args.tag)])
> -        dkr.command(cmd="tag", quiet=args.quiet,
> +        dkr.command(cmd="tag", quiet=not args.verbose,
>                      argv=["%s/%s" % (args.registry, args.tag), args.tag])
>  
>  
> @@ -513,7 +514,7 @@ def run(self, args, argv):
>  
>          # Run the build with our tarball context
>          dkr = Docker(args.command)
> -        dkr.update_image(args.tag, tmp, quiet=args.quiet)
> +        dkr.update_image(args.tag, tmp, quiet=not args.verbose)
>  
>          return 0
>  
> @@ -532,7 +533,8 @@ class ImagesCommand(SubCommand):
>      name = "images"
>  
>      def run(self, args, argv):
> -        return Docker(args.command).command("images", argv, args.quiet)
> +        return Docker(args.command).command("images", argv,
> +                                            quiet=not args.verbose)
>  
>  
>  class ProbeCommand(SubCommand):
> @@ -574,7 +576,7 @@ def run(self, args, argv):
>                  cmd += ["-v", "%s:%s:ro,z" % (p, p)]
>          cmd += [args.image, args.cc]
>          cmd += argv
> -        return Docker(args.command).run(cmd, False, quiet=args.quiet,
> +        return Docker(args.command).run(cmd, False, quiet=not args.verbose,
>                                          as_user=True)
>  
>  


